# Use the official uv image only as a source for the uv executable.
FROM ghcr.io/astral-sh/uv:latest AS uv-source

# This is the actual Python runtime image.
FROM python:3.12-slim-bookworm

# Copy uv into the Python image.
COPY --from=uv-source /uv /uvx /bin/

# pyodbc needs the unixODBC runtime library.
RUN apt-get update \
    && apt-get install -y --no-install-recommends unixodbc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy dependency definitions first.
# This lets Docker cache the dependency installation separately
# from changes to main.py.
COPY pyproject.toml uv.lock ./

# Install dependencies into /app/.venv.
#
# The cache mount preserves downloaded Python packages between builds,
# even when Docker must rerun this step.
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked --no-install-project

# Copy the application only after dependencies are installed.
COPY main.py README.md ./

# Put the uv-created virtual environment first on PATH.
ENV PATH="/app/.venv/bin:$PATH"

CMD ["python", "main.py"]

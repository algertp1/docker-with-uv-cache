this is a poc structure for multiple projects organized into a single compose.yaml

folder looks like this.  dockergroup is not a repo, the subfolders are .

dockergroup/
├── compose.yaml
├── docker1
│   ├── compose.yaml
│   ├── Dockerfile
│   ├── main.py
│   ├── pyproject.toml
│   ├── README.md
│   └── uv.lock
├── pyscript2
│   ├── Dockerfile
│   ├── main.py
│   ├── pyproject.toml
│   ├── README.md
│   └── uv.lock
└── readme.md

compose.yaml was copied to pyscript2 as compose.yaml-copy for ease of recreting but is not reuired there

 
build both with time docker compose build --progress=plain" from this parent folder, "dockergroup"

once built, run them with 
docker compose run --rm pyscript2 

or replace that with the other image docker1
or
docker compose run --rm docker1
docker compose run --rm pyscript2

To demonstrate selective rebuilding, modify something under pyscript2 and run:

time docker compose build --progress=plain

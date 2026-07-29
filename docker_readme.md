this is a poc structure for multiple projects organized into a single compose.yaml

folder looks like this.  dockergroup is not a repo, the subfolders are

for purpose of poc ive not put up the repo for pyscript2 but its trivial to create a hello world type of main.py and docker file .

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

compose.yaml was copied to docker1 as compose.yaml-copy for ease of recreating but is not required there

 
build both with 
    time docker compose build --progress=plain" from this parent folder, "dockergroup"

once built, run them with 
    docker compose run --rm pyscript2 

or replace that with the other image docker1
or

docker compose run --rm docker1
docker compose run --rm pyscript2

To demonstrate selective rebuilding, modify something under docker1 and run:

time docker compose build --progress=plain

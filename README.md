# Polars Arena
Create data for polars benchmark

## Steps
- Create and run the docker container:
  ```
  ./run_docker.sh
  ```

- In the container, create the data:
  ```
  ./create_data.sh
  ```
  If any error is encountered, remove the `.venv` directory from the polars benchmark directory, and rerun this script.


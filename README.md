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
  - If any error is encountered, remove the `.venv` directory from the polars benchmark directory, and rerun this script.
  - If there is version-related error on the `ray` package, manually install the latest ray with `pip instlal ray`.

## Reference
- https://docs.google.com/document/d/1NE4-iFI-vi97yDs0xJ_cqk8No-h9EDlcCCyXwBIHRWU/edit?tab=t.0#heading=h.dcbjan46hgv0
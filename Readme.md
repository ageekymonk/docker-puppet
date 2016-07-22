# Docker Puppetserver

To build Puppetserver, go to puppetserver/<OS>/<version> and run
    ``` make build ```

To build puppetagent, go to puppetagent/<OS>/<version> and run
    ``` make build ```

You can give mount point for puppetserver in the docker-compose.yml file

To run puppet server and agent
docker-compose up

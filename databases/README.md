Used docker images

    Databases images
- https://hub.docker.com/r/blacklabelops/hsqldb
- https://hub.docker.com/_/microsoft-mssql-server
- https://hub.docker.com/_/mysql
- https://hub.docker.com/_/postgres


    Simple UI
- https://hub.docker.com/_/adminer


    Usage 
    In order to up some specific DB just run    
        `docker-compose up -d <db-container-name>, e.g. docker-compose up -d postgres`
        
    In order to down something
        `docker-compose stop <db-container-name>, e.g. docker-compose stop postgres`
        
        
    In order to run adminer(UI) properly it is necessary to specify as server name of runned container, 
    e.g. `postgres-12`
        
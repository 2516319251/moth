```

run: 

    docker build -t image-name .
    docker run --name container-name -p 8081:80 -v /home/moth/config:/www/moth/conf image-name

    or:
    
    docker-compose up --build


then:

    curl -X GET "http://127.0.0.1:8081"

```
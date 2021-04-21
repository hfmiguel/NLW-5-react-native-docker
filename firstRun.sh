## RUN THIS ON FIRST TIME.
## EXPOT INIT CAN OVERWRIDE YOUR PROJECT

docker-compose build && docker-compose up -d && docker exec -it nodejs expo init . && docker exec -it nodejs expo start -w

## IF YOU NEED GET ACCESS ROOT TO YOUR NODEJS CONTAINER, RUN ON TERMINAL : 
# docker exec -itu root {containerName} passwd
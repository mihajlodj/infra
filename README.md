# Infrastructure repository

### Local (linux)

Create docker network
```shell
sudo docker network create ftn_devops_network
```

Start services with Docker Compose
```shell
sudo docker-compose up --build
```

### Docker Swarm (Linux)

Init Docker Swarm
```shell
sudo docker swarm init
```

Create docker network
```shell
sudo docker network create --driver overlay ftn_devops_network_swarm
```

Deploy with Docker Swarm
```shell
sudo docker stack deploy -c docker-compose.yml <your_stack_name>
```

Cleanup
```shell
sudo docker stack rm <your_stack_name>
```
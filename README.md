# salt-demo

# Build the docker containers: 
cd to the Docker/Saltmaster

```
docker build -t bluware/saltmaster-demo .
```

cd to Docker/Saltminion

```
docker build -t bluware/saltminion-demo .
```


# Start the docker containers: 
```
docker network create --driver bridge isolated_nw
docker run --name salt-master -d -v /home/salt-master/config:/etc/salt -v /home/salt-master/state:/srv/salt -v /home/salt-master/pillar:/srv/pillar --network=isolated_nw -p 4505:4505 -p 4506:4506 -p 443:443 bluware/saltmaster-demo:latest
docker run --name salt-minion-web -d --network=isolated_nw --hostname salt-minion-web bluware/saltminion-demo:latest
docker run --name salt-minion-db -d --network=isolated_nw --hostname salt-minion-db bluware/saltminion-demo:latest
docker run --name salt-minion-build -d --network=isolated_nw --hostname salt-minion-build bluware/saltminion-demo:latest
```

# Copy the provided states and pillars to the appropriate location
Copy the contents of 'Pillars' folder to /home/salt-master/pillar

Copy the contents of 'States' folder to /home/salt-master/state

# Log in to salt-master container
```
docker exec -it salt-master bash
```

# Accept salt-minion keys
```
salt-key -A
```

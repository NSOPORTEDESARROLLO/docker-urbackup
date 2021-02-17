If you want to use docker run command:
For PGID and PUID please enter the UID/GID of the user who should own the files outside the container.


```
docker run -d \
                --name urbackup \
                --restart always \
                -e PUID=1000 \  
                -e PGID=100  \
                -e TZ=America/Costa_Rica:ro \
                -v /path/to/your/backup/folder:/backups \
                -v /path/to/your/database/folder:/var/urbackup \
                --network host \
                nsoporte/urbackup:latest

```

For BTRFS-Support add --cap-add SYS_ADMIN to the command above

If you want to externally bind-mount the www-folder add -v /path/to/wwwfolder:/usr/share/urbackup

## Or via docker-compose (compatible with stacks in Portainer):
```
docker-compose.yml
```

```
version: '3'

services:
  urbackup:
    image: nsoporte/urbackup:latest
    container_name: "urbackup"
    restart: "always"
    environment:
      - PUID=1000 # Enter the UID of the user who should own the files here
      - PGID=100  # Enter the GID of the user who should own the files here
      - TZ=America/Costa_Rica
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /data/apps/urbackups/var:/var/urbackup
      - /path/to/your/backup/folder:/backups
      # Uncomment the next line if you want to bind-mount the www-folder
      #- /path/to/wwwfolder:/usr/share/urbackup
    network_mode: "host"
    # Activate the following two lines for BTRFS support
    #cap_add:
    #  - SYS_ADMIN   

````
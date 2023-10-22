#!/bin/sh

HOST_CACHE_DIR_PATH="/nominatim-data"
NOMINATIM_PASSWORD="nominatim_password"

docker run -it \
  --shm-size=8g \
  -e THREADS=8 \
  -e PBF_PATH=/nominatim/share/planet-latest.osm.pbf \
  -e REPLICATION_URL=https://ftp5.gwdg.de/pub/misc/openstreetmap/planet.openstreetmap.org/replication/day \
  -e NOMINATIM_PASSWORD=$NOMINATIM_PASSWORD \
  -e IMPORT_STYLE=admin \
  -v $HOST_CACHE_DIR_PATH/postgresql:/var/lib/postgresql/14/main \
  -v $HOST_CACHE_DIR_PATH/flatnode:/nominatim/flatnode \
  -v $HOST_CACHE_DIR_PATH/share:/nominatim/share \
  -p 8080:8080 \
  --name nominatim \
  mediagis/nominatim:4.3

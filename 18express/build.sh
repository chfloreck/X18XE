#!/bin/bash
docker build -f dockerfiles/Dockerfile -t oracle-db:18cXE .
echo ""
echo ""
echo "docker run -it -p 1621:1521 -p 5600:5500 -h devXE --name devXE oracle-db:18cXE"
echo "docker run -dit -p 1621:1521 -p 5600:5500  --name devXE oracle-db:18cXE"
echo "docker logs -f devXE"
echo "docker exec -it devXE /usr/bin/bash"

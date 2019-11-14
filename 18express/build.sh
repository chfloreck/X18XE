#!/bin/bash
docker build -f dockerfiles/Dockerfile -t oracle-db:18cXE .
echo ""
echo "Erstellen eines Containers, Ausgabe auf Bildschirm, Tastatur attached:"
echo "docker run -it -p 1621:1521 -p 5600:5500 -h devXE --name devXE oracle-db:18cXE"
echo ""
echo "Erstellen eines Containers, keine Ausgabe auf Bildschirm "
echo "docker run -d -p 1621:1521 -p 5600:5500 -h devXE --name devXE oracle-db:18cXE"
echo ""
echo "Starten eines Containers:
echo "docker start devXE"
echo ""
echo "Stoppen eines Containers:"
echo "docker stop devXE"
echo ""
echo "Anzeigen der Log Dateien:"
echo "docker logs -f devXE"
echo ""
echo "Ausführen eines Programmes:"
echo "docker exec -it devXE /usr/bin/bash"

#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static 

cp cesar_website.py tempdir/.
cp -r templates/* tempdir/templates/. 
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip3 install flask" >> tempdir/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  cesar_website.py /home/myapp/" >> tempdir/Dockerfile

echo "EXPOSE 8888" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/cesar_website.py" >> tempdir/Dockerfile

cd tempdir
docker build -t cesar_imagen .

docker run -t -d -p 8888:8888 --name cesar_running cesar_imagen 

docker ps -a

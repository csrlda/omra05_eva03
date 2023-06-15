FROM python
RUN pip3 install flask
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
COPY  cesar_website.py /home/myapp/
EXPOSE 8888
CMD python3 /home/myapp/cesar_website.py

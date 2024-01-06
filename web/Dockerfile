FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y pip python3 build-essential
COPY app.py /home
COPY req.txt /home
WORKDIR /home
RUN pip install -r req.txt
RUN apt install -y libmariadb3 libmariadb-dev
RUN pip install mariadb==1.1.7
EXPOSE 8000
ENTRYPOINT ["python3"]
CMD ["app.py"]

FROM python:alpine3.7
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app
RUN apt-get update && \
apt-get install -y postgresql python-psycopg2 libpq-dev cython && \
pip install — upgrade pip && pip install -r requirements.txt
COPY . /usr/src/app
EXPOSE 8080
ENTRYPOINT [“python3”]
CMD python ./hello.py
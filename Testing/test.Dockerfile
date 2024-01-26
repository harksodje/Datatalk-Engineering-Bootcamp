FROM python:3.11

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2

WORKDIR /app

COPY main_ingestion.py main_ingestion.py

RUN ls -al

ENTRYPOINT [ "python", "main_ingestion.py" ]
# ENTRYPOINT [ "bash" ]
python main_ingestion.py --user admin \
    --password password --host localhost --port 5432 \
    --db ny_taxi --table green_tripdata \
    --url "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz" 

docker run -it --rm --name test-container --network  "testing_default" ingest  --user admin \
    --password password --host pgdatabase --port 5432 \
    --db ny_taxi --table green_tripdata \
    --url "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz"

# load data from s3 to the ny_taxi
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv

# docker run -it --rm --name test-container --network  "testing_default" ingest  --user admin \
#     --password password --host pgdatabase --port 5432 \
#     --db ny_taxi --table taxi_zone \
#     --url "https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv" 

--user admin \
    --password password --host localhost --port 5432 \
    --db ny_taxi --table green_tripdata \
    --url "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz"
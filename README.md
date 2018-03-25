docker build -t py/medicaid .

docker run -d --name psql-medicaid -p 5432:5433 -v $PWD:/tmp -v pg-data:/var/lib/postgresql/data postgres:10.3

docker run -it --rm -v "$PWD":/usr/src/app --link psql-medicaid:postgres --env-file config/dev.env py/medicaid python3 ./scrape2.py


# python container
docker build -t py/medicaid .

# run docker postgres container
docker run -d --name psql-medicaid -p 5432:5433 -v $PWD:/tmp -v pg-data:/var/lib/postgresql/data postgres:10.3

* this can be (should be) simplified into a docker-compose file...
* load db from txt files
docker run -it --rm -v "$PWD":/usr/src/app --link psql-medicaid:postgres --env-file config/dev.env py/medicaid python3 ./scrape2.py

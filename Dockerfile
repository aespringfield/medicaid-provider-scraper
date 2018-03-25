FROM python:3.6

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
  libpq-dev

COPY requirements.txt /usr/src/app
RUN pip3 install -r requirements.txt

COPY . /usr/src/app

CMD [ "python3", "./scrape2.py" ]

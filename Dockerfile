FROM python:3.6

WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app
RUN pip3 install --force-reinstall -r requirements.txt

COPY . /usr/src/app

CMD [ "python3", "./scrape2.py" ]

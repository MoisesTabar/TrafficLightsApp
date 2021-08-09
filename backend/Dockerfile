FROM python:3.7-stretch

WORKDIR /var/usr/api

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

COPY . /var/usr/api/

EXPOSE 5000

CMD ["gunicorn", "-b :5000", "app:app"]
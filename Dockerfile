FROM python:3.11.1

WORKDIR /home/

RUN echo "testing1234"

RUN echo "accountapp_fix"

RUN git clone https://github.com/CloudFlavorKettle/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash","-c", "python manage.py collectstatic --noinput --settings=pragmatic.settings.deploy && python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy pragmatic.wsgi --bind 0.0.0.0:8000"]
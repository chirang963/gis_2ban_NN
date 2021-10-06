FROM python:3.9.0

WORKDIR /home/

RUN echo 'qsdwqcgugg'

RUN git clone https://github.com/chirang963/gis_2ban_NN.git

WORKDIR /home/gis_2ban_NN/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=temp.settings.deploy && python manage.py migrate --settings=temp.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=temp.settings.deploy temp.wsgi --bind 0.0.0.0:8000"]
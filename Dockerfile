FROM python:3.10-slim-bullseye
WORKDIR /app
COPY requirements.txt requirements.txt
RUN ["pip", "install", "-r", "requirements.txt"]
COPY bot /app
ENTRYPOINT ["bash", "-c", "pybabel compile -d locales -D bot; wait-for-it -s $DB_HOST:$DB_PORT; alembic upgrade head; python main.py"]
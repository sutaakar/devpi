FROM python:3.10-alpine

RUN pip install --quiet --upgrade devpi-server

RUN devpi-server --version

RUN devpi-init

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

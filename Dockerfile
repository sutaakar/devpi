FROM python:3.10-alpine

RUN pip install --quiet --upgrade devpi-server

RUN devpi-server --version

RUN mkdir -p /devpi

RUN devpi-init --serverdir /devpi

RUN chmod 777 -Rv /devpi

USER 65532:65532

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

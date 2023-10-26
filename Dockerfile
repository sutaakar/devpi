FROM python:3.9-alpine
 
RUN apk add --update gcc python3-dev libffi-dev musl-dev 

RUN pip install --quiet --upgrade devpi-server devpi-client

RUN devpi-server --version

RUN devpi-init

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

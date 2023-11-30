ARG PYTHON_PACKAGE_VERSION=3.9
FROM python:$PYTHON_PACKAGE_VERSION as devpi

RUN pip install --quiet --upgrade devpi-server

RUN devpi-server --version

RUN mkdir -p /devpi

RUN devpi-init --serverdir /devpi

COPY requirements.txt ./requirements.txt
COPY start-devpi.sh ./start-devpi.sh
RUN chmod +x start-devpi.sh
RUN ./start-devpi.sh

RUN chmod 777 -Rv /devpi

FROM python:3.9-alpine

RUN pip install --quiet --upgrade devpi-server && \
         devpi-server --version

# copy installed packages from builder
COPY --from=devpi /devpi /devpi
RUN chmod 777 -v /devpi

USER 65532:65532

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

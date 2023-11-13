FROM python:3.9 as builder

RUN pip install --quiet devpi-server && \
    pip install pytorch_lightning==1.5.10 && \
    pip install torchmetrics==0.9.1 && \
    pip install torchvision==0.12.0 && \
    pip install ray_lightning 

RUN devpi-server --version

RUN mkdir -p /devpi && devpi-init --serverdir /devpi && chmod 777 -Rv /devpi

FROM python:3.9

# copy installed packages from builder
COPY --from=builder /usr/local /usr/local
COPY --from=builder /devpi /devpi

USER 65532:65532

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

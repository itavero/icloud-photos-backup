FROM python:3.10.4-slim@sha256:e266c9c8a5a11df3183675b60a0a61b8cf22a9eeb4b229af86dcd2daf0f4475a as build

WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY backup.py ./

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8
RUN useradd \
  --no-user-group \
  --no-create-home \
  --uid=1000 \
  app
USER 1000


ENTRYPOINT [ "python", "/app/backup.py"]
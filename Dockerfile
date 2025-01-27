FROM python:3.12-slim-bookworm

LABEL django-blog.vendor="Waldron Technologies, LLC"
LABEL django-blog.version="0.0.1"
LABEL django-blog.authors="ian@waldrontech.co"
LABEL django-blog.website="ianwaldron.com"

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY ./requirements.txt /tmp/requirements.txt

WORKDIR /app

RUN \
    apt-get update && apt-get install -y && \
    # build deps \
    # set up python env \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install --no-cache-dir -r /tmp/requirements.txt && \
    # clean up \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp

COPY ./app /app

ENV PATH="/py/bin:$PATH"
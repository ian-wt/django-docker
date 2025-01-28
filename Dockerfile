FROM python:3.12-slim-bookworm

LABEL django-blog.vendor="Waldron Technologies, LLC"
LABEL django-blog.version="0.0.1"
LABEL django-blog.authors="ian@waldrontech.co"
LABEL django-blog.website="ianwaldron.com"

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY ./requirements.txt /tmp/requirements.txt
COPY scripts /scripts

ARG DEV=false

RUN \
    # add limited user \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user && \
    apt-get update && apt-get install -y \
    # build deps \
      python3-dev \
      libpq-dev \
      gcc \
      --no-install-recommends && \
    # set up python env \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install --no-cache-dir -r /tmp/requirements.txt && \
    # clean up \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp && \
    # permissions
    chown -R django-user:django-user /scripts && \
    chmod -R +x /scripts


WORKDIR /app
COPY ./app /app

ENV PATH="/py/bin:$PATH"
ENV DEV=$DEV

USER django-user

CMD ["/scripts/entrypoint.sh"]
# ^^ if you're not calling this already from your k8s deployment
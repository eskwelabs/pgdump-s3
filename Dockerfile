FROM postgres:11.10-alpine

RUN apk add --no-cache py-pip && pip install awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=ap-southeast-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD /usr/local/bin/entrypoint

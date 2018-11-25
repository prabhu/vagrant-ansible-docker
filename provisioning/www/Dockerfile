FROM alpine:latest

LABEL maintainer="Prabhu Subramanian"

# Install required packages
RUN apk --update add --no-cache sudo add python py-pip openssl ca-certificates \
    && apk --update add --virtual build-dependencies python-dev nginx libffi-dev openssl-dev build-base \
    && pip install --upgrade pip cffi \
    && rm -rf /var/lib/apt/lists/*
RUN apk add --no-cache ca-certificates && update-ca-certificates

# Install ansible
RUN pip install ansible
RUN apk del build-dependencies 

# Copy playbook
COPY playbook.yml /etc/ansible/playbook.yml

RUN mkdir -m 755 /opt/www
COPY index.html /opt/www

# Run playbook
RUN ansible-playbook /etc/ansible/playbook.yml --connection=local

# Expose port 80 or 443 for https
EXPOSE 80

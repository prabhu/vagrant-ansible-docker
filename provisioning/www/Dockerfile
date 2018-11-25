# This image has good defaults for nginx.
# In practice this should get re-created and pulled from a private container registry
FROM nginx:stable-alpine

LABEL maintainer="Prabhu Subramanian"

RUN apk --update add --no-cache python3 py3-pip zip tar make bash bash-completion wget curl jq git openssl openssh-client \
    && rm -rf /var/lib/apt/lists/*
RUN apk add --no-cache ca-certificates && update-ca-certificates
RUN pip3 install --upgrade pip

# Install ansible (Takes few mins)
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make \
  && pip3 install ansible \
  && apk del --purge build

# Copy playbook
COPY playbook.yml /etc/ansible/playbook.yml

COPY index.html /usr/share/nginx/html/

# Run playbook
RUN ansible-playbook /etc/ansible/playbook.yml --connection=local

# Expose port 80 or 443 for https
EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

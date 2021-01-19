FROM alpine:3.11

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles:/home/roles:/home/external_roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib

RUN apk update && apk add --no-cache \
    curl \
    openssh-client \
    openssl \
    ansible && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts && \
    echo 'host.docker.internal' >> /etc/ansible/hosts

CMD ["/bin/sh"]

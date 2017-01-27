FROM jenkins:latest

# Install Kaigara
USER root
RUN curl -sL https://kaigara.org/get | sh
USER jenkins

RUN /usr/local/bin/install-plugins.sh   \
    kubernetes                          \
    workflow-aggregator                 \
    credentials-binding                 \
    git                                 \
    ldap                                \
    gerrit-trigger                      \
    google-login

RUN mkdir -p /usr/share/jenkins/ref/secrets/
RUN echo "false" > /usr/share/jenkins/ref/secrets/slave-to-master-security-kill-switch

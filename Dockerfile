FROM jenkins:2.19.4

# Install Kaigara
USER root
ENV KAIGARA_VERSION v0.0.1
RUN wget https://github.com/mod/kaigara/releases/download/$KAIGARA_VERSION/kaigara-linux-amd64-$KAIGARA_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzf kaigara-linux-amd64-$KAIGARA_VERSION.tar.gz
USER jenkins

RUN /usr/local/bin/install-plugins.sh \
kubernetes:0.8                        \
workflow-aggregator:2.4               \
credentials-binding:1.9               \
git:3.0.1                             \
ldap:1.13                             \
gerrit-trigger:2.23.0

RUN mkdir -p /usr/share/jenkins/ref/secrets/
RUN echo "false" > /usr/share/jenkins/ref/secrets/slave-to-master-security-kill-switch

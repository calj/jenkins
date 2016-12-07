FROM jenkins:2.19.4

RUN /usr/local/bin/install-plugins.sh \
kubernetes:0.8                        \
workflow-aggregator:2.4               \
credentials-binding:1.9               \
git:3.0.0                             \
ldap:1.13

RUN mkdir -p /usr/share/jenkins/ref/secrets/
RUN echo "false" > /usr/share/jenkins/ref/secrets/slave-to-master-security-kill-switch

#Note - many ideas copied from: https://github.com/macropin/docker-sshd
FROM smebberson/alpine-base:1.2.0
COPY build.sh /build.sh
RUN chmod 755 /build.sh
RUN /build.sh
RUN rm build.sh

COPY keygen.sh /etc/cont-init.d/keygen
RUN chmod 755 /etc/cont-init.d/keygen

EXPOSE 22

#-D = don't detach
#-e = output to stderr
#-f = config file
CMD [ "/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_configtail"]

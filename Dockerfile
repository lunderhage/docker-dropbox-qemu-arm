FROM ubuntu:19.04

RUN	apt-get update && \
	apt-get install -y qemu qemu-user-binfmt wget libc6-dev-i386-cross libgcc-7-dev-i386-cross && \
	echo "docker-dropbox" > /etc/hostname

RUN groupadd -g 1000 dropbox && \
	useradd -u 1000 dropbox -g 1000 && \
	mkdir /home/dropbox && \
	chown dropbox /home/dropbox -R

ADD scripts/entrypoint.sh /usr/bin/

USER dropbox

CMD /usr/bin/entrypoint.sh
FROM 	debian:buster-slim

COPY	files/ns-start.sh /usr/bin/


ARG 	DEBIAN_FRONTEND=noninteractive


RUN		apt-get update; apt-get -y upgrade; \
		apt-get -y install krb5-locales libcrypto++6 libcurl4 libfuse2 libgssapi-krb5-2 libk5crypto3 \ 
		libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 libldap-common libnghttp2-14 \
		libreadline7 librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsqlite3-0 \
		libssh2-1 readline-common sqlite3 wget; \
		wget "https://hndl.urbackup.org/Server/2.4.13/debian/buster/urbackup-server_2.4.13_amd64.deb" \ 
		-O /usr/src/urbackup-server_2.4.13_amd64.deb; \
		dpkg -i /usr/src/urbackup-server_2.4.13_amd64.deb; \
		chmod +x /usr/bin/ns-start.sh; \
		rm -rf /usr/src/*





VOLUME	[ "/backups", "/var/urbackup", "/var/log" ]


ENTRYPOINT [ "/usr/bin/ns-start.sh" ]
CMD [ "run" ]

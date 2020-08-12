FROM ubuntu

ENV TZ=Asia

ADD evidence.apk ./evidence.apk
ADD apktool.jar ./apktool.jar

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install apktool -y && \
    apt-get install apache2 -y && \
    apt-get install nginx -y && \
    apt-get clean

ENV TERM xterm
ENV GOPATH /usr/go
RUN mkdir $GOPATH
ENV PATH $GOPATH/bin:$PATH

RUN go get github.com/yudai/gotty
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh


EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"] 

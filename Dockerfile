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

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]  

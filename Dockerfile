FROM elasticsearch:7.3.1

MAINTAINER Semen Chudakov "semen.chudakov7@gmail.com"
MAINTAINER Timofey Chudakov "timofey.chudakov@gmail.com"
MAINTAINER Oleksii Davydenko "olexdav@gmail.com"

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip git
RUN pip3.6 install --upgrade pip

#sysvinit-tools

RUN git clone https://github.com/ElasticHQ/elasticsearch-HQ.git
WORKDIR /usr/share/elasticsearch/elasticsearch-HQ/
RUN pip3.6 install -r requirements.txt

EXPOSE 5000

RUN pip3.6 install news-please
RUN pip3.6 install --upgrade elasticsearch
RUN pip3.6 install --upgrade urllib3
RUN mkdir -p /root/news-please-repo/config
COPY ./news-please-repo/config /root/news-please-repo/config

COPY startup.sh startup.sh
CMD ["bash", "./startup.sh"]

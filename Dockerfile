FROM elasticsearch:7.3.1

MAINTAINER Semen Chudakov "semen.chudakov7@gmail.com"
MAINTAINER Timofey Chudakov "timofey.chudakov@gmail.com"
MAINTAINER Oleksii Davydenko "olexdav@gmail.com"

# docker build -t newsplease_centos .
# docker run -ti -p 9200:9200 -p 9300:9300 -p 5000:5000 -e "discovery.type=single-node" newsplease_centos bash


RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip git
RUN pip3.6 install --upgrade pip

RUN git clone https://github.com/ElasticHQ/elasticsearch-HQ.git
WORKDIR /usr/share/elasticsearch/elasticsearch-HQ/
RUN pip3.6 install -r requirements.txt

EXPOSE 5000

RUN pip3.6 install news-please
RUN pip3.6 install --upgrade elasticsearch
RUN pip3.6 install --upgrade urllib3
RUN mkdir -p /root/news-please-repo/config
COPY ./config /root/news-please-repo/config


COPY startup.sh startup.sh
CMD ["bash", "./startup.sh"]

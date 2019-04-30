# Use an official centos7 image
FROM centos:7

RUN yum update -y \
   && yum install -y https://centos7.iuscommunity.org/ius-release.rpm \
   && yum install -y python36u python36u-libs python36u-devel python36u-pip

RUN localedef -f UTF-8 -i ko_KR ko_KR.utf8 && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
ENV LC_ALL ko_KR.UTF-8
ENV LANG ko_KR.UTF-8


RUN ls -l /bin/python*
RUN unlink /bin/python
RUN ln -s /bin/python3.6 /bin/python3
RUN ln -s /bin/python3.6 /bin/python
RUN ln -s /bin/pip3.6 /bin/pip

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/
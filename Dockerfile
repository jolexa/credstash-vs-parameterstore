FROM centos:7
RUN yum install epel-release -y
RUN yum install python-devel gcc-c++ python-pip openssl libffi-devel openssl-devel zip -y
RUN mkdir /build /code
COPY ./entrypoint.sh ./credstash-test.py /code/
CMD /code/entrypoint.sh

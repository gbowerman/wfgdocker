FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python3-pip
RUN mkdir /wfgeneral
ADD . /wfgeneral/

# copy requirements.txt first to use Docker cache
COPY ./requirements.txt /wfgeneral/requirements.txt

WORKDIR /wfgeneral

RUN pip3 install -r requirements.txt

COPY . /wfgeneral

ENTRYPOINT [ "python3" ]

CMD [ "application.py" ]
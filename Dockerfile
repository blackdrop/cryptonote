FROM ubuntu:14.04

WORKDIR /app/

RUN apt-get update \
 && apt-get install -y build-essential \
                       git \
                       cmake \
                       curl \
                       libboost1.55-all-dev

COPY . /app/

RUN make

CMD ["/app/build/release/src/cryptocoind"]

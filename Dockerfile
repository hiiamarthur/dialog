FROM node:18-alpine
WORKDIR /dialog
# RUN apk add python
RUN apk --no-cache add \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python3 \
      py-pip

RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash linux-headers git
COPY . .
# COPY package.json ./
COPY package.json package-lock.json ./
RUN git clone https://github.com/python/cpython.git 
RUN cd ./cpython && ./configure
# RUN npm install python
RUN npm install 

EXPOSE 4443
# CMD ["npm", "start"]

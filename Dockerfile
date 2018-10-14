FROM node:10

ENV PURESCRIPT_VERSION 0.12.0

WORKDIR /app

COPY ./src /app/src
COPY *.json /app/

RUN mkdir -p /opt \
    && cd /opt \
    && wget https://github.com/purescript/purescript/releases/download/v${PURESCRIPT_VERSION}/linux64.tar.gz \
    && tar -xvf linux64.tar.gz \
    && rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH
RUN yarn global add bower pulp parcel
RUN yarn && bower install --allow-root
RUN pulp build

CMD [ "yarn", "watch" ]
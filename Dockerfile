FROM registry.gitlab.com/avneeshroks/musical-cms:base

WORKDIR /src
COPY . /src

RUN rm yarn.lock && yarn && yarn build

ENTRYPOINT ["yarn","start"]
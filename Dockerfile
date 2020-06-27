FROM registry.gitlab.com/avneeshroks/musical-cms:base

WORKDIR /src
COPY . /src
RUN cp -r /tmp-app/node_modules . && yarn && yarn build

ENTRYPOINT ["yarn","start"]
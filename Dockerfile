# pull base image
FROM node:14
# FROM node:14.13.1-buster-slim

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# default to port 19006 for node, and 19001 and 19002 (tests) for debug
ARG PORT=19006
ENV PORT $PORT
EXPOSE $PORT 19001 19002

# install global packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH /home/node/.npm-global/bin:$PATH


RUN echo "fs.inotify.max_user_instances=524288" >> /etc/sysctl.conf
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
RUN echo "fs.inotify.max_queued_events=524288" >> /etc/sysctl.conf

RUN apt-get -qq update && apt-get -qq -y install bzip2

RUN npm cache verify
RUN npm cache clean --force
RUN npm i --unsafe-perm -g npm@latest
RUN yarn global add expo-cli

# RUN npm add babel-preset-expo

# install dependencies first, in a different location for easier app bind mounting for local development
# due to default /opt permissions we have to create the dir with root and change perms
WORKDIR /opt
RUN mkdir PlantManager

RUN chown root:root -R /opt
USER root

RUN rm -rf react_native_app

WORKDIR /opt/PlantManager
# ENV PATH /opt/PlantManager/.bin:$PATH

# COPY ./react_native_app/package.json ./react_native_app/package-lock.json ./
# RUN npm install

# copy in our source code last, as it changes the most
# for development, we bind mount volumes; comment out for production
# COPY ./react_native_app .
# ENTRYPOINT ["npm", "run"]

CMD ["npm"]
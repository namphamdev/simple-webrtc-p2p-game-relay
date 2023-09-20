FROM node:lts-alpine

# Create app directory
WORKDIR /app

COPY package*.json yarn.lock ./
RUN yarn install --unsafe-perm

# Bundle app source
COPY . .

RUN yarn build

CMD [ "node", "dist/index.js" ]

EXPOSE 3000
FROM node:16.18-alpine

LABEL version="1.1.3" description="Api to control whatsapp features through http requests." 
LABEL maintainer="Davidson Gomes" git="https://github.com/DavidsonGomes"
LABEL contact="contato@agenciadgcode.com"

RUN apk update && apk upgrade && \
    apk add --no-cache git

WORKDIR /evolution

COPY ./package.json .

ENV DOCKER_ENV=true

ENV SERVER_URL=http://localhost:3005

ENV CORS_ORIGIN=*
ENV CORS_METHODS=POST,GET,PUT,DELETE
ENV CORS_CREDENTIALS=true

ENV LOG_LEVEL=ERROR,WARN,DEBUG,INFO,LOG,VERBOSE,DARK,WEBHOOKS
ENV LOG_COLOR=true
ENV LOG_BAILEYS=error

ENV DEL_INSTANCE=false

ENV STORE_MESSAGES=true
ENV STORE_MESSAGE_UP=true
ENV STORE_CONTACTS=true
ENV STORE_CHATS=true

ENV CLEAN_STORE_CLEANING_INTERVAL=7200
ENV CLEAN_STORE_MESSAGES=true
ENV CLEAN_STORE_MESSAGE_UP=true
ENV CLEAN_STORE_CONTACTS=true
ENV CLEAN_STORE_CHATS=true

ENV DATABASE_ENABLED=false
ENV DATABASE_CONNECTION_URI=mongodb://root:root@mongodb:27017/?authSource=admin&readPreference=primary&ssl=false&directConnection=true
ENV DATABASE_CONNECTION_DB_PREFIX_NAME=evolution

ENV DATABASE_SAVE_DATA_INSTANCE=false
ENV DATABASE_SAVE_DATA_NEW_MESSAGE=false
ENV DATABASE_SAVE_MESSAGE_UPDATE=false
ENV DATABASE_SAVE_DATA_CONTACTS=false
ENV DATABASE_SAVE_DATA_CHATS=false

ENV REDIS_ENABLED=false
ENV REDIS_URI=redis://redis:6379
ENV REDIS_PREFIX_KEY=evolution

ENV WEBHOOK_GLOBAL_URL=<url>
ENV WEBHOOK_GLOBAL_ENABLED=false

ENV WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false

ENV WEBHOOK_EVENTS_APPLICATION_STARTUP=false
ENV WEBHOOK_EVENTS_QRCODE_UPDATED=true
ENV WEBHOOK_EVENTS_MESSAGES_SET=true
ENV WEBHOOK_EVENTS_MESSAGES_UPSERT=true
ENV WEBHOOK_EVENTS_MESSAGES_UPDATE=true
ENV WEBHOOK_EVENTS_MESSAGES_DELETE=true
ENV WEBHOOK_EVENTS_SEND_MESSAGE=true
ENV WEBHOOK_EVENTS_CONTACTS_SET=true
ENV WEBHOOK_EVENTS_CONTACTS_UPSERT=true
ENV WEBHOOK_EVENTS_CONTACTS_UPDATE=true
ENV WEBHOOK_EVENTS_PRESENCE_UPDATE=true
ENV WEBHOOK_EVENTS_CHATS_SET=true
ENV WEBHOOK_EVENTS_CHATS_UPSERT=true
ENV WEBHOOK_EVENTS_CHATS_UPDATE=true
ENV WEBHOOK_EVENTS_CHATS_DELETE=true
ENV WEBHOOK_EVENTS_GROUPS_UPSERT=true
ENV WEBHOOK_EVENTS_GROUPS_UPDATE=true
ENV WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=true
ENV WEBHOOK_EVENTS_CONNECTION_UPDATE=true
ENV WEBHOOK_EVENTS_CALL=true

ENV WEBHOOK_EVENTS_NEW_JWT_TOKEN=false

ENV CONFIG_SESSION_PHONE_CLIENT=Warezap
ENV CONFIG_SESSION_PHONE_NAME=chrome

ENV QRCODE_LIMIT=30

ENV AUTHENTICATION_TYPE=apikey

ENV AUTHENTICATION_API_KEY=WarezapApi
ENV AUTHENTICATION_EXPOSE_IN_FETCH_INSTANCES=true

ENV AUTHENTICATION_JWT_EXPIRIN_IN=0
ENV AUTHENTICATION_JWT_SECRET='L=0YWt]b2w[WF>#>:&E`'

ENV AUTHENTICATION_INSTANCE_MODE=server

ENV AUTHENTICATION_INSTANCE_NAME=evolution
ENV AUTHENTICATION_INSTANCE_WEBHOOK_URL=<url>
ENV AUTHENTICATION_INSTANCE_CHATWOOT_ACCOUNT_ID=1
ENV AUTHENTICATION_INSTANCE_CHATWOOT_TOKEN=123456
ENV AUTHENTICATION_INSTANCE_CHATWOOT_URL=<url>

RUN npm install

COPY . .

RUN npm run build

CMD [ "node", "./dist/src/main.js" ]

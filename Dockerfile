FROM node:17-slim

# Create app directory
WORKDIR /app

# Cloud Sql Proxy
RUN apt-get update \
  && apt-get install -y \
    wget \
  ;
RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
RUN chmod +x cloud_sql_proxy

COPY package*.json ./
RUN npm install

COPY . .

CMD ["sh", "-c", "./cloud_sql_proxy -instances=trash-test-12345:us-central1:myinstance=tcp:127.0.0.1:3306 & npx knex migrate:latest; npx knex seed:run"]

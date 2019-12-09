FROM node:10.15.2

COPY package.json .

RUN npm install -g npm
RUN npm install -g gatsby-cli
RUN npm install

COPY binder/ binder/
COPY src/ src/
COPY gatsby-browser.js .
COPY gatsby-config.js .
COPY gatsby-node.js .
COPY meta.json .
COPY theme.sass .

COPY static/ static/
COPY chapters/ chapters/
COPY exercises/ exercises/
COPY slides/ slides/

RUN npm run build

EXPOSE 8000
CMD ["gatsby", "serve", "--port", "8000", "--host", "0.0.0.0"]

FROM node

RUN git clone https://github.com/nicolay-zlobin/jesse-trades-info.git

COPY ./.env /jesse-trades-info/
WORKDIR /jesse-trades-info/
RUN npm install
RUN npm run build


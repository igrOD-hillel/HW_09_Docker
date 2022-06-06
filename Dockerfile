FROM alpine
WORKDIR /opt/app/
COPY ./ ./
ENV PORT=80
RUN apk add --update --no-cache nodejs npm\
    && adduser user -D -h /opt \
    && chown -R user:user /opt/app \
    && chmod 755 /opt/app
USER user
RUN npm install
CMD npm start
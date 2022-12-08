FROM alpine:latest

RUN mkdir /var/flaskapp

RUN adduser -h /var/flaskapp/ -s /bin/sh -D flaskapp

WORKDIR /var/flaskapp

COPY .  .

RUN apk update

RUN apk add python3

RUN pip3 install -r requirement.txt

RUN chown -R flaskapp:flaskapp /var/flaskapp/

USER flaskapp

EXPOSE 5000 

ENTRYPOINT ["python3"]

CMD ["app.py"]

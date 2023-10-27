FROM alpine as build
RUN apk add build-base upx
RUN echo 'main(){sleep(5);}' > main.c && \
    gcc -s -static -o sleep main.c && \
    upx sleep

FROM scratch
COPY --from=build sleep /
CMD ["/sleep"]

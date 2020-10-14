FROM oracle/graalvm-ce:20.2.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/challenge-mn
WORKDIR /home/app/challenge-mn

RUN native-image -cp target/challenge-mn-*.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/challenge-mn/challenge-mn /app/challenge-mn
ENTRYPOINT ["/app/challenge-mn"]

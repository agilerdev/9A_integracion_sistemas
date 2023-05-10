FROM dart:stable AS build

WORKDIR /app



COPY . .

RUN rm -rf .dart_tool
RUN rm -rf .dart_frog

RUN dart pub get


RUN dart test 

RUN dart pub global activate dart_frog_cli
RUN dart pub global run dart_frog_cli:dart_frog build

# RUN dart pub get --offline
RUN dart compile exe build/bin/server.dart -o build/bin/server -Dhost=db

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/build/bin/server /app/bin/

CMD ["/app/bin/server"]
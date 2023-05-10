FROM dart:stable As dependencias

WORKDIR /app
COPY . .

RUN rm -rf .dart_tool
RUN rm -rf .dart_frog

RUN dart pub get

FROM dart:stable As test

COPY --from=dependencias /app /app
WORKDIR /app

RUN dart test 

FROM dart:stable As build
COPY --from=dependencias /app /app
WORKDIR /app

RUN dart pub global activate dart_frog_cli
RUN dart pub global run dart_frog_cli:dart_frog build

# RUN dart pub get --offline
RUN dart compile exe build/bin/server.dart -o build/bin/server -Dhost=db

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/build/bin/server /app/bin/

CMD ["/app/bin/server"]
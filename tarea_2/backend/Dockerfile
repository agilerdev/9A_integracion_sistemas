FROM dart:stable
WORKDIR /app
COPY pubspec.* ./
# RUN 
RUN dart pub get
# COPY . .
# RUN dart pub get --offline
# RUN 
# RUN dart run stormberry migrate --port=5432 --db=dart --password=admin --db=dart --host=db --username=postgres --no-ssl --apply-changes
# RUN dart pub global activate dart_frog_cli


CMD dart run build_runner build --delete-conflicting-outputs; dart run stormberry migrate --port=5432 --db=dart --password=admin --db=dart --host=db --username=postgres --no-ssl --apply-changes; dart pub global activate dart_frog_cli; dart pub global run dart_frog_cli:dart_frog dev

# CMD ["dart", "pub", "global", "run", "dart_frog_cli:dart_frog", "dev"]


# RUN pwd > /bacan.txt
# RUN ["cd","/","&&" "touch", "el_bacan.txt"]
# RUN ["pwd", "touch", "/el_bacan.txt"]
# RUN pwd
# RUN rm pubspec.lock
# RUN rm -rf .dart_tool/
# RUN ls -a
# RUN dart pub get
# RUN dart run build_runner build --delete-conflicting-outputs
# RUN dart run stormberry migrate --port=5432 --db=dart --password=admin --db=dart --host=db --username=postgres --no-ssl --apply-changes



# Resolve app dependencies.

# RUN dart pub global activate dart_frog_cli
# CMD ["dart", "pub", "global", "run", "dart_frog_cli:dart_frog", "dev"]
# CMD dart pub get; dart run build_runner build --delete-conflicting-outputs; dart run stormberry migrate --port=5432 --db=dart --password=admin --db=dart --host=db --username=postgres --no-ssl --apply-changes; dart pub global activate dart_frog_cli; dart pub global run dart_frog_cli:dart_frog dev


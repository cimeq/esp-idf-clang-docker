# esp-idf-clang-docker
This docker was made to be able to use both idf.py clang-check and gcovr in CICD tool like jenkins.

# Usage
Localy you can do:

## Build
```
docker build --tag salco/esp-idf-clang-docker:lastest --no-cache --rm -f ./Dockerfile .
```

## Tests
```
docker run --name docker-idf -ti --rm --volume /tmp/project:/tmp/test salco/esp-idf-clang-docker:lastest
```

# Jenkins
Here is an example in a `Jenkinsfile`.

> TBD


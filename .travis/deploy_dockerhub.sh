#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
echo "$DOCKER_USER:$DOCKER_PASS"
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
echo $TRAVIS_REPO_SLUG:$TAG
docker push $DOCKER_USER/$TRAVIS_REPO_SLUG:$TAG

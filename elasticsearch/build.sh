set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=juanmartinez
# image name
IMAGE=elasticsearch

version=`cat VERSION`
buildDate=`date +"%y.%m.%d"`


docker build \
  --build-arg JUPYTERLAB_VERSION=$version \
  -t $USERNAME/$IMAGE:$version-$buildDate \
  -t $USERNAME/$IMAGE:$version \
  -t $USERNAME/$IMAGE:latest .

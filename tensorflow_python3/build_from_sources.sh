# see https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker

export TF_DOCKER_BUILD_TYPE=CPU
export TF_DOCKER_BUILD_IS_DEVEL=YES
export TF_DOCKER_BUILD_DEVEL_BRANCH=r1.2
export TF_DOCKER_BUILD_IMAGE_NAME=tensorflow_py3
export TF_DOCKER_BUILD_VERSION=1.2
export TF_DOCKER_BUILD_PYTHON_VERSION=PYTHON3

./scripts/parameterized_docker_build.sh




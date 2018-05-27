WITH_CUDA=on

if [ $# -e 2 ]; then
    WITH_CUDA=off
fi


docker build --tag opencv:latest-env ./docker

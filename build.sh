export WITH_CUDA=ON

if [ $# -e 2 ]; then
    export WITH_CUDA=OFF
fi


docker build --tag opencv:latest-env ./docker

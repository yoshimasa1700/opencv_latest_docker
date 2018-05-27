export WITH_CUDA=ON

if [ $# -ne 0 ]; then
    export WITH_CUDA=OFF
fi


docker build --tag opencv:latest-env --build-arg WITH_CUDA="$WITH_CUDA" ./docker 

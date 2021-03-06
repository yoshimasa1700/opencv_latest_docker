FROM nvidia/cuda:8.0-devel

# for nvidia-docker
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

ARG WITH_CUDA=ON

RUN apt-get update && \
    apt-get install -y \
    python-pip \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libavformat-dev \
    libpq-dev \
	libxine2-dev \
	libglew-dev \
	libtiff5-dev \
	zlib1g-dev \
	libjpeg-dev \
	libpng12-dev \
	libjasper-dev \
	libavcodec-dev \
	libavformat-dev \
	libavutil-dev \
	libpostproc-dev \
	libswscale-dev \
	libeigen3-dev \
	libtbb-dev \
	libgtk2.0-dev \
	pkg-config \
    python-dev \
    python-numpy \
    python3-dev \
    python3-numpy \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN echo test2

WORKDIR /

# clone from repository.
RUN git clone https://github.com/opencv/opencv.git

# create build directory.
RUN mkdir -p /opencv/build
WORKDIR /opencv/build

# cmake!
RUN cmake -DBUILD_TIFF=ON \
    -DBUILD_opencv_java=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_CUDA=$WITH_CUDA \
    -DBUILD_OPENCV_PYTHON3=ON \
    -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 \
    -DCUDA_ARCH_BIN='3.0 3.5 5.0 6.0 6.2' \
    -DCUDA_ARCH_PTX="" \
    -DCPU_DISPATCH=AVX,AVX2 \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_OPENGL=OFF \
    -DWITH_OPENCL=OFF \
    -DWITH_QT=OFF \
    -DWITH_IPP=ON \
    -DWITH_TBB=ON \
    -DFORCE_VTK=ON \
    -DWITH_EIGEN=ON \
    -DWITH_V4L=ON \
    -DWITH_XINE=ON \
    -DWITH_GDAL=ON \
    -DWITH_1394=OFF \
    -DWITH_FFMPEG=OFF \
    -DBUILD_PROTOBUF=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    ..

# build.
RUN export NUMPROC=$(nproc --all) \
    && make -j$NUMPROC install

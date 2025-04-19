# Multi-stage build for development and production

ARG BASE_IMAGE=ubuntu:22.04
FROM ${BASE_IMAGE} AS builder

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    BUILD_TYPE=Release \
    CONAN_VERSION=2.0.5 \
    NINJA_VERSION=1.12.1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    python3-pip \
    python3-dev \
    pkg-config \
    software-properties-common  \
    lsb-release  \
    wget \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y wget build-essential
RUN wget https://cmake.org/files/v3.31/cmake-3.31.0-linux-x86_64.sh
RUN bash cmake-3.31.0-linux-x86_64.sh

RUN cmake --version


RUN pip install --no-cache-dir conan==${CONAN_VERSION}

# Install Ninja
WORKDIR /tmp
RUN git clone https://github.com/ninja-build/ninja.git
RUN cd ninja
RUN git checkout v${NINJA_VERSION}
RUN cmake -Bbuild-cmake -H.
RUN cmake --build build-cmake
RUN cp build-cmake/ninja /usr/local/bin/

# Configure Conan
RUN conan profile detect --force

# Copy project files
WORKDIR /app
COPY . .

# Build the project
RUN mkdir -p build/${BUILD_TYPE}
RUN cd build/${BUILD_TYPE}

RUN cmake -G Ninja -DCMAKE_PREFIX_PATH=build/Release/generators  -DCMAKE_BUILD_TYPE=Release .

RUN cmake --build .
# Runtime image
#FROM ${BASE_IMAGE} AS runtime
#
## Install runtime dependencies
#RUN apt-get update && apt-get install -y \
#    libstdc++6 \
#    && rm -rf /var/lib/apt/lists/*
#
## Copy built binaries
#COPY --from=builder /app/build/${BUILD_TYPE}/Ciple-Framework /usr/local/bin/

# Set entrypoint
#ENTRYPOINT ["Ciple-Framework"]
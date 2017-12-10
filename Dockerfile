FROM ubuntu:16.04

ENV AMDAPPSDKROOT=/opt/AMDAPPSDK-3.0

ENV SCRATCH /working

RUN mkdir $SCRATCH
WORKDIR $SCRATCH
RUN apt update && apt install -y curl bzip2
RUN curl -s https://gitlab.com/mike-k/amd-app-sdk/raw/master/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 -o AMD-APP-SDKInstaller.tar.bz2 && \
  tar -xjf AMD-APP-SDKInstaller.tar.bz2
RUN ./AMD-APP-SDK-*.sh -- --acceptEULA 'yes' -s
RUN ln -sf /opt/AMDAPPSDK-3.0/lib/x86_64/sdk/libOpenCL.so.1 /opt/AMDAPPSDK-3.0/lib/x86_64/libOpenCL.so
RUN rm -rf $SCRATCH
WORKDIR /

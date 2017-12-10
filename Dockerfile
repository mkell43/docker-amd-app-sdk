FROM ubuntu:16.04

RUN apt update && apt install -y curl bzip2

RUN curl -s https://gitlab.com/mike-k/amd-app-sdk/raw/master/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 -o AMD-APP-SDKInstaller.tar.bz2
RUN tar -xjf AMD-APP-SDKInstaller.tar.bz2
RUN ./AMD-APP-SDK-*.sh -- --acceptEULA 'yes' -s
RUN rm AMD-APP-SDK-*.sh && rm -rf AMDAPPSDK-*

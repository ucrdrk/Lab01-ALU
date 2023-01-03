FROM ubuntu:latest

RUN apt update && apt install -y verilog

WORKDIR /cs161l/lab01

COPY *.v /cs161l/lab01/
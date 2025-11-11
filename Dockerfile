# syntax=docker/dockerfile:1
ARG HIPHASE_VERSION=v1.5.0

FROM rust:1.91.1-alpine3.22 AS builder

ARG HIPHASE_VERSION
RUN apk add --no-cache git build-base cmake
RUN git clone --branch $HIPHASE_VERSION https://github.com/PacificBiosciences/HiPhase.git
WORKDIR /HiPhase
RUN cargo install --locked --root /usr/local --path .

FROM scratch AS slim

COPY --from=builder /usr/local/bin/hiphase /usr/local/bin/hiphase

ENTRYPOINT ["hiphase"]

FROM alpine:3.22 AS nextflow

COPY --from=builder /usr/local/bin/hiphase /usr/local/bin/hiphase

# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed
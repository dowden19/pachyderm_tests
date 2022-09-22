FROM rocker/r-ver:4.2.1
RUN mkdir /targets
COPY targetscript.R /targets/targetscript.R
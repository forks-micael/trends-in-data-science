#!/bin/sh
sudo docker run --rm -d -p 80:8787 -e PASSWORD=letmein --entrypoint='' -v $(pwd):/home/rstudio tonyjward/rstudio:analyse


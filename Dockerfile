Stus-MBP:git browns$ more ./jenkins_tests/Dockerfile
# use a node base image
FROM node:latest

# set maintainer
LABEL maintainer "stu@stubrown.uk.net"
# set a health check

# tell docker what port to expose
EXPOSE 8000
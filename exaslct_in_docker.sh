docker run -it -v $PWD:$PWD -v /var/run/docker.sock:/var/run/docker.sock -w $PWD exatk/script-languages:exalsct_docker_runner bash ./exaslct $*

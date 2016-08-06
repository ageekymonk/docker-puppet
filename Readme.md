# Docker Image for puppet Server
## Tags and Dockerfile

Version of puppetserver is maintained as is. OS version is appended at the end.

-	[`latest`, `2.4.0-1puppetlabs1-jessie`(*puppetserver/Dockerfile_jessie*)](https://github.com/ageekymonk/docker-puppet/blob/master/puppetserver/Dockerfile_jessie)
-	[`latest-wheezy`, `2.4.0-1puppetlabs1-wheezy`(*puppetserver/Dockerfile_wheezy*)](https://github.com/ageekymonk/docker-puppet/blob/master/puppetserver/Dockerfile_wheezy)

## Environment Variables

`JAVA_ARGS` - Set to change the default value
`AUTOSIGN`  - Set `true` to autosign agents
`CERTNAME`  - Set to change the certname settings

## Ports
Puppet server ports 8080 and 8140 are used

## Volumes
You can mount your local folder for `/etc/puppetlabs`

## docker-compose

```
puppetserver:
  image: puppetserver:2.4.0-1puppetlabs1-jessie
  tty: true
  stdin_open: true
  environment:
    JAVA_ARGS: "-Xms1g -Xmx1g -XX:MaxPermSize=256m"
    AUTOSIGN: "true"
    CERTNAME: puppetserver
  expose:
    - 8080
    - 8140
  volumes:
    - /mount/point/for/puppetserver:/etc/puppetlabs

```

## To build from git repository
### Puppetserver
To build Puppetserver, go to puppetserver/ and run
    ``` make generate LINUX_DISTRIB=ubuntu LINUX_DISTRIB_VERSION=trusty ```

### Puppetagent
To build puppetagent, go to puppetagent/\<OS\>/\<version\> and run
    ``` make build ```


You can give mount point for puppetserver in the docker-compose.yml file

To run puppet server and agent
    ``` docker-compose up ```

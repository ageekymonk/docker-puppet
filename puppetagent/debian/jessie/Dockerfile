FROM debian:jessie

MAINTAINER ramzthecoder@gmail.com

ENV RELEASE jessie

ENV \
  PUPPET_AGENT_VERSION=1.5.2-1${RELEASE} \
  PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

RUN apt-get update \
  && apt-get install -y curl locales-all \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-${RELEASE}.deb \
  && dpkg -i puppetlabs-release-pc1-${RELEASE}.deb \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
  && apt-get install -y --force-yes git \
    puppet-agent=$PUPPET_AGENT_VERSION \
  && rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/puppetlabs"]

# Configure entrypoint
COPY /docker-entrypoint.sh /usr/local/bin/
COPY /docker-entrypoint.d/* /usr/local/bin/docker-entrypoint.d/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["puppet", "agent", "--no-daemonize"]

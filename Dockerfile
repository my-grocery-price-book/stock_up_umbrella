# 1: Use ruby base:
FROM crystallang/crystal:0.35.1

ARG UNAME=dev
ARG UID=1000
ARG GID=1000
ARG PWD=/usr/src/app
ARG USER_HOME=/usr/src

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn


RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list.d/pgdg.list && \
    apt-get update  -q --fix-missing && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    postgresql-client-12 \
    libc6-dev \
    libevent-dev \
    libssl-dev \
    libyaml-dev \
    zlib1g-dev \
    && apt-get clean


# 2: We'll set the application path as the working directory
WORKDIR $PWD

RUN groupadd -g $GID -o $UNAME
RUN useradd -d ${USER_HOME} -u $UID -g $GID -o -s /bin/bash $UNAME
RUN chown ${UNAME} ${USER_HOME}
USER $UNAME

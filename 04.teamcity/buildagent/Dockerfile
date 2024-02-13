FROM jetbrains/teamcity-agent

# Need root to install
USER root
# Install nodejs v. 14
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
# Install nodejs v. 21 debian
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - 

RUN apt install -y nodejs
RUN node --version
# Back to lower permission user
USER buildagent
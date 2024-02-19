FROM artifactory.prod.hulu.com/hulu-docker/telemetry/dockerfiles/corretto-17-maven:1.0.0

ARG NODE_VERSION=20.11.0

# Install redocly via npm
RUN touch ~/.bashrc && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    . ~/.bashrc && \
    nvm install $NODE_VERSION
ENV PATH=$PATH:/root/.nvm/versions/node/v${NODE_VERSION}/bin
RUN npm i -g @redocly/cli@1.9.0 && \
    npm cache clean --force && \
    rm -rf /build
ENV REDOCLY_ENVIRONMENT=docker

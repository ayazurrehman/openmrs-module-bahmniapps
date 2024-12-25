FROM ubuntu:22.04

# Install general dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    build-essential \
    software-properties-common

# Install Node.js 14.x
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# Install Ruby 3.1 using rbenv instead of brightbox PPA
RUN apt-get update && apt-get install -y \
    git \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    autoconf \
    bison \
    build-essential \
    libyaml-dev \
    libreadline-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev

# Install rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
    && git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Install Ruby 3.1.0
RUN /root/.rbenv/bin/rbenv install 3.1.0 \
    && /root/.rbenv/bin/rbenv global 3.1.0

# Add rbenv to PATH for this RUN
ENV PATH="/root/.rbenv/shims:/root/.rbenv/bin:${PATH}"

# Install Compass (Ruby-based)
RUN gem install compass

# Install global npm tools
RUN npm install -g yarn bower grunt-cli

# Create an application directory
WORKDIR /usr/src/app

# Optional: expose a volume
VOLUME ["/usr/src/app"]

# Expose a common port if your dev server runs here
EXPOSE 3000

# By default, open a shell for interactive dev
CMD ["/bin/bash"]
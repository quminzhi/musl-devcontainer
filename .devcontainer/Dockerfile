FROM debian:stable-slim

# Non-interactive install
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    fish \
    tmux \
    vim \
    git \
    curl \
    clang-format \
    exuberant-ctags cscope \
    ca-certificates \
    man \
    less \
    locales \
    bash \
    ncurses-bin \
 && rm -rf /var/lib/apt/lists/*

# Set locale (optional but recommended)
RUN sed -i '/en_US.UTF-8/s/^# //' /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set fish as default shell
RUN echo /usr/bin/fish >> /etc/shells && chsh -s /usr/bin/fish root

# Copy your local config files
COPY .devcontainer/config/vimrc /root/.vimrc
COPY .devcontainer/config/tmux.conf /root/.tmux.conf
COPY .devcontainer/config/clang-format /workspace/.clang-format

# Set working directory (your mounted code will go here)
WORKDIR /workspace

# Start in tmux
CMD ["tmux"]


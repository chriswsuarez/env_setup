FROM ros:humble

SHELL ["/bin/bash", "-c"]

# set the ros version
ENV ROS_DISTRO humble

# switch to home dir
WORKDIR /root

# install some useful packages and upgrade existing ones
RUN apt update && apt upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
    apt-utils \
    git \
    curl \
    nano \
    vim \
    tmux \
    x11-apps \
    python3-pip \
    python-is-python3 \
    bash-completion \
    libqt5websockets5-dev \
    iputils-ping \
    net-tools \
    nmap \
    ros-humble-desktop-full

# setup .bashrc
SHELL ["/bin/bash", "-l", "-c"]
RUN echo -e "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc \
    && echo -e "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.profile \
    && echo -e "source ~/env_setup/aliases/generic_aliases" >> ~/.bashrc \
    && echo -e "source ~/env_setup/aliases/ros2_aliases" >> ~/.bashrc

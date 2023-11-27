FROM ros:noetic

SHELL ["/bin/bash", "-c"]

# set the ros version
ENV ROS_DISTRO noetic

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
    python3-catkin-tools \
    python-is-python3 \
    bash-completion \
    libqt5websockets5-dev \
    qt5-default \
    ros-noetic-desktop

# setup .bashrc
SHELL ["/bin/bash", "-l", "-c"]
RUN echo -e "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc \
    && echo -e "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.profile \
    && echo -e "source ~/chris_setup/aliases/generic_aliases" >> ~/.bashrc

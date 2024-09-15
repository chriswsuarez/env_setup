#!/bin/bash

sudo apt update
sudo apt upgrade

# Set Distrbution release variable
DISTRIB_RELEASE=$( grep DISTRIB_RELEASE /etc/lsb-release | awk 'BEGIN { FS="="}; {print $2}' | sed 's/\\./-/' )

if [[ $DISTRIB_RELEASE = "18.04" ]]; then
    ROS_DISTRO="melodic"
elif [[ $DISTRIB_RELEASE = "20.04" ]]; then
    ROS_DISTRO="noetic"
else
    echo "Unsupported Ubuntu version"
    exit 1
fi

# Add newline to bashrc before we make changes
echo -e "\n" >> ~/.bashrc

# Add the default path var in bashrc so we can unsource ROS if needed
echo "DEFAULT_PATH=$PATH" >> ~/.bashrc 

# Git
sudo apt install -y git
git config --global user.name "chriswsuarez"
git config --global user.email "chriswsuarez@utexas.edu"

# Visual Studio code
sudo snap install code --classic

# Sublime 
sudo snap install sublime-text --classic

# catkin_tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'

# pip
if [[ $DISTRIB_RELEASE = "18.04" ]]; then
    sudo apt install -y python-pip
elif [[ $DISTRIB_RELEASE = "20.04" ]]; then
    sudo apt install -y python3-pip
else
    echo "pip not installed"
fi

# Install ROS
sudo apt install -y curl # if you haven't already installed curl
if [[ $DISTRIB_RELEASE = "18.04" ]]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo apt update
    sudo apt install -y ros-melodic-desktop-full
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
elif [[ $DISTRIB_RELEASE = "20.04" ]]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo apt update
    sudo apt install -y ros-noetic-desktop-full
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
else
    echo "ROS not installed"
fi

echo "source ~/env_setup/aliases/generic_aliases" >> ~/.bashrc
echo "source ~/env_setup/aliases/ros1_aliases" >> ~/.bashrc
source ~/.bashrc

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
    


# Git
sudo apt install git

# Visual Studio code
sudo snap install --classic code

# Sublime 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text


# catkin_tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'

# Install ROS
sudo apt install curl # if you haven't already installed curl
if [[ $DISTRIB_RELEASE = "18.04" ]]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo apt update
    sudo apt install ros-melodic-desktop-full
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
elif [[ $DISTRIB_RELEASE = "20.04" ]]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo apt update
    sudo apt install ros-noetic-desktop-full
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
else
    echo "ROS not installed"
fi

echo "source ~/chris_setup/aliases/generic_aliases" >> ~/.bashrc
source ~/.bashrc

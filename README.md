
 _   _  ___  ____  _   _  _____ 
| \ | ||_ _|/ ___|| | | ||_   _|
|  \| | | || |  _ | |_| |  | |  
| |\  | | || |_| ||  _  |  | |  
|_| \_||___|\____||_| |_|  |_|  

Night-Bot ROS 2 Simulation 🤖
Welcome to the Night-Bot simulation project! This repository contains a fully containerized ROS 2 (Jazzy Jalisco) environment, integrated with Gazebo for physics simulation and teleoperation.
🚀 What's Inside?
•	Robot: Custom night_bot URDF model.
•	Environment: Dockerized Ubuntu 24.04 + ROS 2 Jazzy.
•	Features: Gazebo simulation, ROS-Gazebo bridge, and real-time keyboard control (teleop_twist_keyboard).
🛠️ Quick Start Guide
1. Build the Environment
$ docker build -t night_ros2_robot_sim .

2. Run the Container (with GUI support)
$ docker run -it --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix night_ros2_robot_sim /bin/bash

3. Launch the Demo (Open 4 terminals inside Docker)
•	Terminal 1 (Gazebo): gz sim -r empty.sdf
•	Terminal 2 (Spawn Robot): ros2 run ros_gz_sim create -file /root/ros2_ws/src/simple_robot_description/urdf/robot.urdf -name night_bot -z 0.5
•	Terminal 3 (Bridge): ros2 run ros_gz_bridge parameter_bridge /model/night_bot/cmd_vel@geometry_msgs/msg/Twist@gz.msgs.Twist
•	Terminal 4 (Control): ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args -r /cmd_vel:=/model/night_bot/cmd_vel

## 📺 Simulation Preview

![Night-Bot Demo](./ROS2-Gazebo-Docker-Integration-Demo.webm)

Enjoy driving Night-Bot! 🏎️💨

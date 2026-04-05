# 1. 指定基底：就像選擇地基，我們直接用官方調配好的 ROS 2 Jazzy 環境
FROM osrf/ros:jazzy-desktop

# 2. 設定環境變數：讓系統知道我們現在在處理自動化安裝
ENV DEBIAN_FRONTEND=noninteractive

# 3. 安裝額外的工具：安裝模擬器 Gazebo 和鍵盤控制套件
RUN apt-get update && apt-get install -y \
    ros-jazzy-ros-gz \
    ros-jazzy-teleop-twist-keyboard \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 4. 建立工作空間：就像在電腦裡開一個專用的資料夾
WORKDIR /root/ros2_ws

# 5. 複製你的程式碼：把主機上的 ros2_ws 資料夾複製進去這台「虛擬電腦」
COPY ./ros2_ws ./src

# 6. 編譯程式碼：讓 ROS 2 認識你的機器人模型
RUN . /opt/ros/jazzy/setup.sh && \
    colcon build --symlink-install

# 7. 設定自動載入：每次打開這台虛擬電腦時，自動把環境設定好
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc && \
    echo "source /root/ros2_ws/install/setup.bash" >> ~/.bashrc

# 8. 設定預設指令：開啟後預設進入 bash 視窗
CMD ["/bin/bash"]

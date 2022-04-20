FROM ubuntu:latest
RUN apt update && apt install openssh-server sudo cron -y && \
    useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test && \
    echo 'test:test' | chpasswd && \
    echo 'test     ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    service ssh start
CMD ["/usr/sbin/sshd","-D"]

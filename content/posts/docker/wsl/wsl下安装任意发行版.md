+++
title = 'wsl下安装任意发行版'
date = 2024-05-30T00:22:49+08:00
tags = ['wsl','docker']
categories = ['wsl']

+++

# 如何使用wsl在windows上安装任意linux发行版

> 注意：默认已经安装好wsl2和docker

## 第一步：获取发行版的tar文件

### 以获取fedora的tar文件示例

1. 从docker仓库拉取fedora，并运行

   ```bash
   docker pull fedora
   docker run fedora
   dockerContainerID=$(docker container ls -a | grep -i fedora | awk '{print $1}')
   ```

2. 使用`docker export`导出容器的`tar`文件

   ```bash
   docker export dockerContainerID -o fedora.tar fedora
   ```

3. 使用`wsl --import <Distro> <InstallLocation> <FileName>`导入

   - 将文件移动到想要保存的目录，并创建虚拟磁盘目录，以便储存

       ```powershell
       mv .\fedora.tar ~\etc\wsl\fedora\fedora.tar
       cd ~\erc\wsl\fedora
       mkdir vDisk
       ```

   - 导入`.tar`文件

     ```powershell
      wsl --import fedora .\vDisk\ .\fedora.tar
     ```

     提示：
     
     <img src="https://raw.githubusercontent.com/luobai0110/blogpic/main/image-20240530004614502.png" alt="image-20240530004614502" style="zoom:200%;" />

4. 使用`wsl -d fedora`运行刚导入的fedora

   ```powershel
   wsl -d fedora
   ```

5. 安装基本软件包，添加用户并添加到sudo

   ```bash
   dnf groupinstall "Development Tools"
   $username=luobai
   adduser $username
   echo "$username ALL=(ALL) ALL" >> /etc/sudoers
   echo -e "[user]\ndefault=$username" >> /etc/wsl.conf
   passwd $username
   ```



## 写在最后

通过容器导出的linux会缺很多的软件包，包括很多常用的，例如`su`，`ip`之类的

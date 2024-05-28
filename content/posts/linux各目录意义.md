+++
title = 'linux各目录意义'
date = 2024-05-29T03:41:31+08:00
tags= ['linux']
categories = ['linux']

+++

<!--more--->

# linux 各目录标准

1. **/bin** - 二进制（Binary）：存放基本的系统二进制文件，如`ls`、`cp`、`mv`等命令。
2. **/boot** - 启动（Boot）：包含启动 Linux 内核和引导程序所需的文件，如`vmlinuz`和`initrd`。
3. **/dev** - 设备（Device）：包含设备文件，这些文件作为系统硬件设备和软件接口。
4. **/etc** - 主机特定的配置（Etc）：存放系统和应用程序的配置文件。
5. **/home** - 用户主目录（Home）：用户的个人目录，每个用户都有自己的子目录。
6. **/lib** - 库（Library）：包含系统使用的共享库文件。
7. **/media** - 媒体（Media）：用于挂载可移动媒体设备，如 USB 驱动器、CD-ROMs 等。
8. **/mnt** - 挂载点（Mount）：通常用于临时挂载文件系统。
9. **/opt** - 可选应用程序（Optional）：第三方应用程序安装的位置。
10. **/proc** - 进程（Process）：虚拟文件系统，提供关于运行中的进程和内核的信息。
11. **/root** - 根用户的主目录：系统管理员（root 用户）的主目录。
12. **/sbin** - 超级用户二进制（Superuser binary）：包含系统管理工具，通常只有 root 用户才能访问。
13. **/srv** - 服务（Service）：包含系统服务的数据。
14. **/tmp** - 临时文件（Temporary）：存放临时文件，通常在系统启动时清空。
15. **/usr** - unix 系统资源（unix system resources ）：包含只读的用户相关应用程序和文件。
    - `/usr/bin`：用户级的应用程序。
    - `/usr/share`：共享数据，如文档、图标等。
    - `/usr/local`：本地安装的软件，优先级高于`/usr`。
16. **/var** - 可变状态（Variable）：包含经常变化的文件，如日志文件、数据库文件等。

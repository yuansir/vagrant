### 可以用在平时开发用的Vagrant环境和配置

#### Box

- [ubuntu-14.04-amd64.box](https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box)
- `vagrant box add ubuntu/fuck path/to/ubuntu-14.04-amd64.box`

#### 目录文件说明

- `Vagrantfile` vagrant配置文件
- `bootstrap.sh` vagrant provision shell 脚本
- `etc/` 开发环境所需的配置文件，暂时只有nginx 和 supervisord，根据个人实际情况添加
- `hosts` 在宿主机hosts需要添加的IP绑定，根据个人实际情况添加
- `projects/`  项目存放目录
- `scripts/` Vagrant Provision Shell，根据个人实际情况添加



#### 其他Vgrant常用命令

- `vagrant init` 初始化box的操作（本项目已配置好无需该操作）
- `vagrant ssh` 登录虚拟主机
- `vagrant up` 启动虚拟机
- `vagrant box list` 已添加box列表
- `vagrant box remove` 删除box
- `vagrant destroy` 停止当前正在运行的虚拟机并销毁所有创建的资源
- `vagrant halt` 关机
- `vagrant reload` 重新启动虚拟机，主要用于重新载入配置文件
- `vagrant suspend` 挂起当前的虚拟机
- `vagrant resume` 恢复前面被挂起的状态
- `vagrant ssh-config` 输出用于ssh连接的一些信息
- `vagrant status` 获取当前虚拟机的状态

#### 默认启动安装软件

- `beanstalk`
- `composer`
- `mysql  5.6`
- `nginx 1.8`
- `node.js v4.2`
- `php 5.6`
- `redis 2.8.4`
- `supervisor`

#### 实例：phpmyadmin

- 添加 `127.0.0.1 phpmyadmin.dev` 到宿主机的hosts文件
- 添加Nginx配置文件 `phpmyadmin.dev.conf`  到 `etc/nginx` 目录下
- 将phpmyadmin源码程序放入 `projects/` 目录下
- 进入vagrant reload or restart nginx
- 浏览器访问 `phpmyadmin.dev:9999`

#### 补充

- 如果以上软件安装失败，可以进入vagrant 后执行对应的安装脚本，比如 `/vagrant/scripts/redis.sh`
- 需要安装其他软家可在`scripts/` 下自行添加
- MySql 默认 root 密码 12345
- 对应的端口映射请到 `Vagrantfile` 自行更改

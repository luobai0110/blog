---
title: Nginx端口转发
date: 2024-05-28T19:08:28+08:00
---

<!--more-->

# nginx 端口转发

## 配置信息实例

### 转发域名到本地端口

```nginx
server{
  listen 80;
  server_name  example.com;
  index  index.php index.html index.htm;

  location / {
    proxy_pass  http://127.0.0.1:8080; # 转发规则
    proxy_set_header Host $proxy_host; # 修改转发请求头，让8080端口的应用可以受到真实的请求
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```

### 将域名转发到另一个域名

```nginx
server {
    listen 8080;
    server_name 47.109.87.254:8080;
    index inedx.html;

    location / {
        proxy_pass http://100.80.5.62:8080;
        proxy_set_header Host $proxy_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

### 转发本地端口到其他域名

```nginx
server {
        listen 8080;
        server_name localhost:8080;

        location / {
            proxy_pass http://172.31.75.163:8080;
            proxy_set_header Host $proxy_host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
```

## 加`/`和不加`/`

### 加`/`

```nginx
server_name 47.109.87.254
location /data/ {
    proxy_pass http://127.0.0.1/;
}
```

访问`http://47.109.87.254/data/example`会转发到`http://127.0.0.1/example`

### 不加`/`

```nginx
server_name 47.109.87.254
location / {
    proxy_pass http://127.0.0.1/;
}
```

访问`http://47.109.87.254/data/exmaple`会转发到`http://127.0.0.1/data/example`

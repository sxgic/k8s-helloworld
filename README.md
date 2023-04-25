# k8s-helloworld

MacOS 下 测试 k8s，通过简单的 hello-world 程序。

1. 需要的软件
1.1 Docker
1.2 kubernetes（k8s， kubectl， minikube）

2. 需要的技术
2.1 go
2.2 html
2.3 yaml

## Env build

### Docker

1.1 安装 docekr `brew install --cask --appdir=/Applications docker`
1.2 检查安装 `docker verison`

打开启动器中的 docker app 程序，授权，然后运行。

1.3 查看 docker 进程 `docker ps`

1.4 卸载 `brew remove docker`

#### Docker run

```bash
docker run --detach --net=host --name=kube-apiserver \
    --restart=always \
    --volume=/usr/share/ca-certificates:/etc/ssl/certs \
    --volume=/var/run/kubernetes:/var/run/kubernetes \
    --volumes-from=kube-apiserver-conf-0.0.1 \
    kelseyhightower/kube-apiserver:0.20.0 \
    --admission-control=LimitRanger,ServiceAccount,ResourceQuota \
    --authorization-mode=ABAC \
    --authorization-policy-file=/etc/kubernetes/policy.jsonl \
    --client-ca-file=/etc/kubernetes/ca.pem \
    --cluster-name=kubernetes \
    --etcd-servers=http://127.0.0.1:2379 \
    --insecure-bind-address=127.0.0.1 \
    --insecure-port=8080 \
    --logtostderr=true \
    --secure-port=6443 \
    --service-cluster-ip-range=10.200.20.0/24 \
    --tls-cert-file=/etc/kubernetes/server.pem \
    --tls-private-key-file=/etc/kubernetes/server-key.pem \
    --v=2
```

### k8s

#### 安装 k8s 命令行版本

1. 下载安装

    ```bash
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
    mv kubectl ~/ && chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    sudo chown root: /usr/local/bin/kubectl
    ```

2. HomeBrew 安装

    ```bash
    brew install kubernetes-cli
    brew install kubectl
    ```

2.2 检查安装 `kubectl version`/`kubectl version --client`

#### 安装其他工具（[minikube](https://minikube.sigs.k8s.io/docs/)）

Minikube 是由 Kubernetes 社区维护的单机版的 Kubernetes 集群，支持 macOS、Linux and Windows 等多种操作系统平台。
使用最新的官方 stable 版本，并支持 Kubernetes 的大部分功能，从基础的容器编排管理，到高级特性如负载均衡、Ingress，权限控制等。

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
```

启动 `sudo minikube start`

### 创建一个自己的 dokcer image

先去 <https://hub.docker.com/> 创建一个账号。

```bash
docker build -t hello_html:v0.1 .
docker login
docker image tag hello_html:v0.1 **username**/hello_html:v0.1
docker push  **username**/hello_html:v0.1
docker run -d --name kube-test -p 8080:80 **username**/hello_html:v0.1
```

Pull 别人已经创建的 image <https://hub.docker.com/r/gkpanshi/hello_html>。

```bash
docker pull gkpanshi/hello_html:v0.1
```

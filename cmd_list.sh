docker version
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
mv kubectl ~/
cd ~/
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl
kubectl version --client
kubectl version
docker version
brew install --cask --appdir=/Applications docker
docker info
docker version
brew install kubernetes-cli
kubectl version
kubectl cluster-info
brew remove docker
brew install --cask docker
docker ps
docker version
kubectl version --client
kubectl create -f hello-world.yaml
kubectl get all
kubectl version -o json
docker ps | grep kube-apiserver
docker run --detach --net=host --name=kube-apiserver \\
    --restart=always \\
    --volume=/usr/share/ca-certificates:/etc/ssl/certs \\
    --volume=/var/run/kubernetes:/var/run/kubernetes \\
    --volumes-from=kube-apiserver-conf-0.0.1 \\
    kelseyhightower/kube-apiserver:0.20.0 \\
    --admission-control=LimitRanger,ServiceAccount,ResourceQuota \\
    --authorization-mode=ABAC \\
    --authorization-policy-file=/etc/kubernetes/policy.jsonl \\
    --client-ca-file=/etc/kubernetes/ca.pem \\
    --cluster-name=kubernetes \\
    --etcd-servers=http://127.0.0.1:2379 \\
    --insecure-bind-address=127.0.0.1 \\
    --insecure-port=8080 \\
    --logtostderr=true \\
    --secure-port=6443 \\
    --service-cluster-ip-range=10.200.20.0/24 \\
    --tls-cert-file=/etc/kubernetes/server.pem \\
    --tls-private-key-file=/etc/kubernetes/server-key.pem \\
    --v=2
docker rm kube-apiserver-conf-0.0.1
kubectl get node
mkdir ~/.kube
touch ~/.kube/config
kubectl get node
kubectl config view
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo kubeadm init
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64\
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
minikube start
sudo minikube start
sudo minikube delete
sudo minikube start
sudo minikube start --force --driver=docker
kubectl create -f hello-world.yaml
vim hello-world.yaml
kubectl create -f hello-world.yaml
sudo kubectl version
docker version
sudo kubectl get all
kubectl create -f hello-world.yaml
docker run -p 8080:8080 -t hello_go_http
kubectl create -f hello_go_http.yaml
docker build -t hello_go_http .
docker login
docker image tag hello_go_http:v0.1 gkpanshi/hello_go_http:v0.1
docker push gkpanshi/hello_go_http:v0.1
docker run -d --name hello_go_http -p 8080:80 gkpanshi/hello_go_http:v0.1
sudo kubectl create -f hello_go_http.yaml
sudo kubectl get all
docker stop 876859876a52
docker ps
sudo kubectl get all
sudo kubectl get pods -A
sudo minikube start --force --driver=docker
sudo kubectl get pods -A
sudo kubectl get all
curl http://localhost:30081
curl -v http://10.100.214.217:30080/helloworld
sysctl -a | grep -E --color 'machdep.cpu.features|VMX'
kubectl version --client
docker images
sudo kubectl get nodes -o wide
sudo minikube start --force --driver=docker
sudo kubectl get nodes -o wide
sudo kubectl get pods -o wide
sudo minikube ssh
sudo kubectl get all
curl -v http://loaclhost:30080/helloworld
sudo minikube dashboard
python3 -m http.server
docker build -t hello_html:v0.1 .
docker login
docker image tag hello_html:v0.1 gkpanshi/hello_html:v0.1
docker push gkpanshi/hello_html:v0.1
docker run -d --name hello_html -p 8090:8090 gkpanshi/hello_html:v0.1
sudo kubectl create -f hello-html.yaml
sudo minikube ssh
sudo kubectl create -f hello-html.yaml
sudo minikube stop
sudo minikube start --force --driver=docker
sudo minikube ssh
sudo kubectl get pod --all-namespaces
sudo kubectl delete -f hello-html.yaml
sudo kubectl apply -f hello-html.yaml
sudo minikube ssh
docker ps
docker exec -it hello_html bash
curl http://localhost:8080/helloworld
curl http://localhost:32082
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter
sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sudo tee /etc/hosts <<EOF
192.168.56.5   master
192.168.56.6   worker1
192.168.56.7   worker2
192.168.56.8   worker3
EOF
sudo sysctl --system

apt-get update ; apt-get install -y containerd
mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml
sed -i "s/SystemdCgroup = false/SystemdCgroup = true/g" /etc/containerd/config.toml
systemctl restart containerd
apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
apt-add-repository -y "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt install -y kubeadm kubelet kubectl

install_k8s () {

	ips=$(hostname -I | awk '{print $2}')
	kubeadm init --apiserver-advertise-address $ips --pod-network-cidr=192.168.0.0/16

	mkdir -p $HOME/.kube
	cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
	kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

}

get_token () {
	kubeadm token create --print-join-command
}

get_token () {
	kubeadm token create --print-join-command
}


if [ $HOSTNAME == "master" ]
then
	install_k8s
	export token=$(get_token)
else 
	echo "skipping config"
fi

echo $token

#if [ $HOSTNAME == "worker[1-3]"]
#then
#	$token
#fi


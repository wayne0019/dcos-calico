tee env.export <<-'EOF'
# This will be customer-specific, so it's at the top
export CALICO_CIDR=172.16.0.0/16

## Env variables
export MASTER_LIST=$(curl -sS master.mesos:8181/exhibitor/v1/cluster/status | python -c 'import sys,json;j=json.loads(sys.stdin.read());print(",".join([y["hostname"]+"=https://"+y["hostname"]+":2380" for y in j]))')

export ETCD_ROOT_DIR=/opt/etcd
export ETCD_DATA_DIR=/var/etcd/data
export ETCD_TLS_CERT=etcd.crt
export ETCD_TLS_KEY=etcd.key
export ETCD_CA_CERT=dcos-ca.crt
export LOCAL_HOSTNAME=$(/opt/mesosphere/bin/detect_ip)
export INITIAL_CLUSTER=${MASTER_LIST}

export CALICO_CNI_PLUGIN_DIR=/opt/calico/plugins
export CALICO_CNI_CONF_DIR=/etc/calico/cni

export CALICO_NODE_IMAGE=quay.io/calico/node:v2.6.9

export ETCD_CERTS_DIR=/etc/etcd/certs
export DOCKER_CLUSTER_CERTS_DIR=/etc/docker/cluster/certs
export CALICO_NODE_CERTS_DIR=/etc/calico/certs/node
export CALICO_CALICOCTL_CERTS_DIR=/etc/calico/certs/calicoctl
export CALICO_CNI_CERTS_DIR=/etc/calico/certs/cni

EOF

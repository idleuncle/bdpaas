alias ls='ls -F --color=auto'
export REGISTRY_HOST=192.168.11.110:5000
export PATH=/home/vagrant/sandbox/docker/scripts:$PATH
if [ -f /usr/share/doc/cdargs/examples/cdargs-bash.sh ]; then
    source /usr/share/doc/cdargs/examples/cdargs-bash.sh
fi

# infra/devstack

## dependencies ([Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads))

on Debian (or Ubuntu):

```shell
sudo apt-get install vagrant virtualbox
```

on macOS:

```shell
brew tap caskroom/cask
brew cask install virtualbox
brew cask install vagrant
```

## usage

in _this_ directory:

```shell
vagrant up
```

this will create and run a new virtual machine as described by `./Vagrantfile`.

then, connect to the vm with:

```shell
vagrant ssh
```

and when inside the vm, run:

```shell
cd ~/devstack
./stack.sh
```

this will take a while, as it will install and run [`devstack`](https://github.com/openstack-dev/devstack).

after it finishes, check your local `openstack` works with:

```shell
source ./openrc
openstack
```

next we will download and load our [Debian base openstack image](http://cdimage.debian.org/cdimage/openstack/):

```
export DEBIAN_IMAGE_FILE=debian-8.6.3-20161129-openstack-amd64.qcow2
wget http://cdimage.debian.org/cdimage/openstack/current/${DEBIAN_IMAGE_FILE}
glance image-create --name="Debian Jessie 64-bit" \
  --disk-format=qcow2 --container-format=bare \
  --property architecture=x86_64 \
  --progress \
  --file ${DEBIAN_IMAGE_FILE}
```

check it loaded with:

```shell
openstack image list
```

```txt
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| a4f34e26-2bf7-49e6-932d-f5dd3c98165d | Debian Jessie 64-bit            | active |
| ...                                  | ...                             | ...    |
+--------------------------------------+---------------------------------+--------+
```

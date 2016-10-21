# setup

## dependencies

### install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

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

### install [packer](https://www.packer.io)

on Debian (or Ubuntu): install latest from [ahdinosaur/debian-packer/releases/](https://github.com/ahdinosaur/debian-packer/releases/)

```shell
wget https://github.com/ahdinosaur/debian-packer/releases/download/0.10.2/packer_0.10.2_amd64.deb
sudo dpkg -i packer_0.10.2_amd64.deb
```

on macOS:

```
brew install packer
```

### install [terraform](https://www.terraform.io)

on Debian (or Ubuntu): install latest from [ahdinosaur/debian-packer/releases/](https://github.com/ahdinosaur/debian-packer/releases/)

```shell
wget https://github.com/ahdinosaur/debian-terraform/releases/download/0.7.6/terraform_0.7.6_amd64.deb
sudo dpkg -i terraform_0.7.6_amd64.deb
```

on macOS:

```
brew install terraform
```

## development

### build dev stack

### run dev stack

## production

### get OpenStack credentials

### build prod stack

### deploy prod stack

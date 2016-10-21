# infrastructure

the truth about the cloud, open source.

sponsored by [Enspiral Root Systems](https://github.com/enspiral-root-systems/)

**work in progress**

## what?

we are a [tech consultancy co-op](https://www.youtube.com/watch?v=Zo9TOSxnY2I).

we rely on servers to be our friends. we need them when the user wants to view our (client's) beautiful app, but we also need them when we want to test, build, deploy, manage, log, etc our apps. these server friends are our "infrastructure".

### overview

we want a setup where:

- the configuration of our setup is described as files in a `git` repository
- it's easy to change the configuration via pull requests and the usual GitHub flow
- we have standard development, deployment, and maintenance practices across projects
- moving from development to production to maintenance doesn't involve fighting dragons
- every project we do has continuous integration and deployment by default
- it's easy to spin up small bots to do useful and fun tasks for us
- we are not locked into a specific cloud vendor, so we can run servers anywhere in the world
- all the services we rely on are hosted by us, preferably local to where we live
- shit doesn't break all the time, so we get to spend time and energy doing what we love

## how?

### dependencies

- [catalyst cloud](www.catalyst.net.nz/catalyst-cloud)
- [packer](https://www.packer.io)
- [terraform](https://www.terraform.io)
- [saltstack](https://saltstack.com)
- [docker](https://www.docker.io)
- [jenkins](https://jenkins.io/)

### [setup]('./SETUP.md')

### workflow

#### develop infra images using vagrant

#### build infra images using packer

#### deploy infra instances using terraform and openstack

#### orchestrate infra instances using saltstack

#### deploy web apps with GitHub

1. developer pushes to git repo
1. git repo triggers jenkins pipeline
1. jenkins builds and pushes docker image
1. docker image triggers staging deploy

### toplogy

- the primary support server
  - hosts saltstack master
  - hosts jenkins master
  - handles dns for the network
  - provides an npm cache for the build servers
  - provides a private docker registry
- some follower support servers
  - hosts saltstack minion
  - hosts jenkins agent
  - builds our docker images
  - runs our tests
  - pushes our docker images
- some { staging, production } web apps
  - hosts saltstack minion
  - pulls release docker images
  - runs app container(s) behind nginx proxy
- a { staging, production } postgres database

### networks

ip addresses are of shape: `10.${location}.${type}.${instance}`

locations:

- `nz-por-1`: 100

types:

- `saltstack master`: 1
- `saltstack minion`: 2
- `jenkins master`: 3
- `jenkins agent`: 4
- `web staging`: 5
- `web production`: 6
- `postgres staging`: 7
- `postgres production`: 8
- `docker registry`: 9
- `npm cache`: 10

## resources

- [Packer - automating virtual machine image creation](http://alexconst.net/2016/01/11/packer/)
- [How we deploy from Slack using Jenkins, Terraform, Docker and Ansible](https://medium.com/@levinotik/how-we-deploy-from-slack-using-jenkins-terraform-docker-and-ansible-4196b6856cdf)
- [Subnetting the Server network. Best Practices?](https://www.reddit.com/r/networking/comments/41ukww/subnetting_the_server_network_best_practices/)

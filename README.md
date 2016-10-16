# infrastructure

{[Open](https://docs.openstack.org/),[Salt](https://docs.saltstack.com)}Stack infrastructure for [Root Systems](https://github.com/enspiral-root-systems/)

**work in progress**

## overview

we are a [tech consultancy co-op](https://www.youtube.com/watch?v=Zo9TOSxnY2I).

this setup aims to provide us with:

- cloud infrastructure without vendor lock-in using [OpenStack](https://docs.openstack.org/) and Debian
- configuration management and orchestration using [SaltStack](https://docs.saltstack.com)
- service management using `systemd`
- containerized services using `docker`
- continuous integretation and deployment using buildkite
- friendly and fun web apps using Node.js

## [install]('./INSTALL.md')

## agents

- [ ] SaltStack master
- [ ] dns server
- [ ] npm cache
- [ ] private docker registry
- [ ] buildkite agent
- [ ] Postgres database
- [ ] web app (staging or production)

## workflow

1. developer pushes to git repo
1. git repo triggers buildkite pipeline
1. buildkite builds and pushes docker image
1. salt master listens to docker push, deploys staging

## nodes

- master
  - SaltStack master
  - dns server
  - npm cache
  - private docker registry
- build
  - buildkite agents
- staging
  - staging apps
- db
- prod

## networks

private network: `10.100.0.0/16`

- one: `10.100.0.1`
- builder(s): `10.1.1.x`
- staging: `10.100.10.1`
- database: `10.100.100.1`
- app(s): `10.100.101.x`

public load balancers to staging and app(s)

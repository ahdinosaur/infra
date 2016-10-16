# install

using Rackspace OpenStack:

- create a private network at `10.100.0.0/16`
  - update `infra-secrets` pillar: `cloud.providers.rackspace.networks` with private network UUID
- create a cloud server
  - name: `master0`
  - region: `SYD`
  - image: Debian 8 (Jessie)
  - flavor: 512MB Standard Instance
  - ssh key: add your own
  - networks: include private network above
- bootstrap cloud master
  - create file `./master-location` with IP address of new cloud server in public network
  - update `infra-secrets` `cloud.master` config with IP address of new cloud server in private network
  - run `npm run master:bootstrap`
  - if successful, will print ssh keys
    - add public key as "deploy key" to `infra-secrets` repo
    - add private and public to `infra-secrets` `salt.gitfs.keys` config

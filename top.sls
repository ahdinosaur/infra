base:
  'roles:salt-minion':
    - match: grain
    - salt.minion
  'roles:salt-master':
    - match: grain
    - salt.master
    - salt.cloud
    - salt.gitfs.pygit2
    - cloud

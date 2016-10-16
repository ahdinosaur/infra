base:
  'G@roles:salt-minion':
    - salt.minion
  'G@roles:salt-master':
    - salt.master
    - salt.gitfs.keys
    - salt.gitfs.pygit2
    - cloud

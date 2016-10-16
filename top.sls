base:
  'roles:salt-minion':
    - match: grain
    - salt.minion
  'roles:salt-master':
    - match: grain
    - salt.master
    - salt.minion
    - salt.cloud
    - salt.pkgrepo
    - cloud

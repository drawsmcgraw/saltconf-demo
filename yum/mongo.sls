mongo-yum:
  pkgrepo:
    - managed
    - name: mongodb
    - humanname: MongoDB Repository
    - baseurl: http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
    - gpgcheck: 0
    - enabled: 1

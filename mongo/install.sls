include:
  - yum.mongo

mongodb-org:
  file:
    - managed
    - name: /etc/mongod.conf
    - source: salt://mongo/files/mongod.conf
  pkg:
    - installed
  service:
    - running
    - enable: True
    - name: mongod



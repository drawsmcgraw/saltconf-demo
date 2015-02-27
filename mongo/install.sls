include:
  - yum.mongo

mongodb-org:
  pkg:
    - installed
  file:
    - managed
    - name: /etc/mongod.conf
    - source: salt://mongo/files/mongod.conf
    - require:
      - pkg: mongodb-org
  service:
    - running
    - enable: True
    - name: mongod
    - require:
      - pkg: mongodb-org
    - watch:
      - file: mongodb-org



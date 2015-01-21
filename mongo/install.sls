mongodb-server:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - name: mongod

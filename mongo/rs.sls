mongodb-rs:
  file:
    - managed
    - name: /tmp/mongo-rs.conf
    - source: salt://mongo/files/configure-rs.js
    - template: jinja
  cmd:
    - run
    - name: mongo /tmp/mongo-rs.conf

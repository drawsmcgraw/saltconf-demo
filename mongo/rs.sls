mongodb-rs:
  file:
    - managed
    - name: /tmp/mongo-rs.js
    - source: salt://mongo/files/configure-rs.js
    - template: jinja
  cmd:
    - run
    - name: mongo /tmp/mongo-rs.js



mongodb-rs:
  cmd:
    - script
    - name: salt://mongo/files/configure-rs.sh
    - template: jinja


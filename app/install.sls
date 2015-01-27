### /srv/salt/awesome-app/app.sls ###
#####################################

### Install Nodejs and start a simple
### web application that reports the server IP.

install-app:
  # Install prerequisites
  pkg:
    - installed
    - pkgs: 
      - nodejs
      - npm
      - nodejs-mongodb

  # Place our Node code
  file: 
    - managed
    - source: salt://app/files/app.js
    - name: /root/app.js

  # Install the package called 'forever'
  cmd:
    - run
    - name: npm install forever -g
    - require:
      - pkg: install-app

  npm:
    - installed
    - name: mongodb

run-app:
  # Use 'forever' to start the server
  cmd:
    - run
    - name: forever start app.js
    - cwd: /root

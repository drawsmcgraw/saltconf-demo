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

#  npm:
#    - installed
#    - name: mongodb
#    - dir: /root

static-content:
  file:
    - managed
    - source: salt://app/files/index.html
    - name: /root/index.html
    - template: jinja

# Restart the app if it's already running.
restart-app:
  cmd:
    - run
    - name: forever restartall
    - cwd: /root
    - onlyif: forever list | grep app

# Else, start the app.
run-app:
  cmd:
    - run
    - name: forever start app.js
    - cwd: /root
    - unless: forever list | grep app

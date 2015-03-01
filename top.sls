base:
  # Everyone
  '*':
    - core.etc-hosts

  # All Mongo Servers
  'roles:*mongo*':
    - match: grain
    - mongo.install

  # All reverse proxy servers
  'roles:*rproxy*':
    - match: grain
    - app.rproxy

  # All app servers
  'roles:*ui*':
    - match: grain
    - app.install

  # Mongo replica set primary
  '*mongo*-01*':
    - mongo.rs


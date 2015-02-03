base:
  'roles:*mongo*':
    - match: grain
    - mongo.install

  'roles:*rproxy*':
    - match: grain
    - app.rproxy

  'roles:*app*':
    - match: grain
    - app.install

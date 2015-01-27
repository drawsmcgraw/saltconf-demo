base:
  'roles:mongo:true':
    - match: pillar
    - mongo.install

  'roles:rproxy:true':
    - match: pillar
    - app.rproxy

  'roles:app:true':
    - match: pillar
    - app.install

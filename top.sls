base:
  *mongo*:
    - mongo.install
    - mongo.rs

  *rproxy*:
    - app.rproxy

  *app*:
    - app.install

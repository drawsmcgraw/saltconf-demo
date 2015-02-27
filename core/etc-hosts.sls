# Manage entries in /etc/hosts for the deployment

etc-hosts:
  file:
    - append
    - template: jinja
    - name: /etc/hosts
    - sources:
      - salt://core/files/etc-hosts.tmpl


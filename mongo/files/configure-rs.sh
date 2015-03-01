#!/bin/bash

mongo <<EOL
function addHosts(){
  {% for host,ip in salt['mine.get']('roles:*mongo*', 'network.ip_addrs', expr_form='grain').items() -%}
  rs.add("{{host}}")
  {% endfor -%}
}

rs.initiate()

# Wait 10 seconds, then add hosts
setTimeout(addHosts,10000)
EOL

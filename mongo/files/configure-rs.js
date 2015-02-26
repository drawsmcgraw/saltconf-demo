rs.initiate()
{% for host,ip in salt['mine.get']('roles:*mongo*','network.ip_addrs', expr_form='grain').items %}
rs.add("{{host}}")
{% endfor %}

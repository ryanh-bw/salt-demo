pkgs:
  {% if grains['os_family'] == 'RedHat' %}
  mysql: mysql-community-server
  vim: vim-enhanced
  {% elif grains['os_family'] == 'Debian' %}
  mysql: mysql-server
  vim: vim
  {% elif grains['os'] == 'Arch' %}
  mysql: mysql-server
  vim: vim
  {% endif %}

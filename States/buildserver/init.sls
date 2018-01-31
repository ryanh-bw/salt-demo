{% for pkg in pillar.get('pkgs', {}) %}
{{ pkg }}:
  pkg:
    - installed
{% endfor %}


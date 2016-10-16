{% set cloud = pillar.get('cloud', {}) %}
{% for name, profile in cloud.get('instances', {}).items() %}
{{ name }}:
  cloud.profile:
    - profile: {{ profile }}
{% endfor %}

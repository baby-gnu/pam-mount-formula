# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import pam__mount with context %}

include:
  - {{ sls_config_clean }}

pam-mount-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ pam__mount.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
{% set mwlib = salt['grains.filter_by']({
  'Debian': {
    'libxml': 'libxml2-dev',
    'libxslt': 'libxslt-dev',
  },
  'RedHat': {
    'libxml': 'libxml2-devel',
    'libxslt': 'libxslt-devel',
  }
}) %}

deps:
  pkg:
    - installed
    - pkgs:
      - {{ mwlib.libxml }}
      - {{ mwlib.libxslt }}
      - python-pip

mwlib:
  pip:
    - installed
    - require:
      - pkg: deps

mrjob==0.2.8:
  pip:
    - installed
    - require:
      - pkg: deps

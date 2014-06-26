{% set apache = salt['grains.filter_by']({

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
      - {{ libxml }}
      - {{ libxslt }}

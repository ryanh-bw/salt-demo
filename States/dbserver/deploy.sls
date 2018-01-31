mysql:
  pkg.installed:
    - name: {{ pillar['pkgs']['mysql'] }}

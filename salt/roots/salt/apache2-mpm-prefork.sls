apache2-mpm-prefork:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /usr/local/php55/lib/php.ini

/etc/apache2/sites-enabled/mysite.com.conf:
    file.managed:
        - user: root
        - contents_pillar: virtualhosts:vhost

/etc/apache2/conf.d/php.conf:
    file.copy:
        - name: /etc/apache2/conf.d/php.conf
        - source: /srv/salt/apache2/conf.d/php.conf
        - force: True
        - makedirs: True

/etc/apache2/apache2.conf:
    file.copy:
        - name: /etc/apache2/apache2.conf
        - source: /srv/salt/apache2/apache2.conf
        - force: True
        - makedirs: True

/usr/local/php55/lib/php.ini:
    file.managed:
        - contents_pillar: data:custom
virtualhosts:
    vhost: |
        <VirtualHost *:80>
                CustomLog /var/log/apache2/mysite.com-access.log combined
                DocumentRoot /var/www/web
                ServerName mysite.com
                ServerAlias localhost

                <Directory /var/www/web>
                        AllowOverride All
                        Order allow,deny
                        Allow from all
                </Directory>
        </VirtualHost>
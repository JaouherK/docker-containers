# Caddy Server with PHP-FPM

[![](https://images.microbadger.com/badges/image/stevepacker/caddy-php7.svg)](https://microbadger.com/images/stevepacker/caddy-php7 "Get your own image badge on microbadger.com")

This creates a Docker container running PHP on Alpine Linux.

## Why another container?  

I just wanted all the PHP libraries I tend to use.

It also supports running commands before and after starting PHP-FPM and running 
`composer install` before running PHP-FPM.

It also includes the (https://wiki.archlinux.org/index.php/SSMTP)[ssmtp] package so that after its configured you can use PHP's mail() function.

## Run Example

- `docker run -p 80:80 -p 443:443 -v /var/www/html:/srv stevepacker/caddy-php7`


## Docker Environment Variables

- `PHP_BEFORE`: command(s) to run prior to running `composer install` and `php-fpm`
- `PHP_COMPOSER_FLAGS`: flags to include with `composer install` (ex: --prefer-dist --no-dev)
- `PHP_AFTER`: command(s) to run after `composer install` and `php-fpm`

## Docker Volumes

- `/srv`: Base directory.  If a `composer.lock` is in this directory, 
    `composer install` will automatically run prior to starting `php-fpm`
- `/root/.caddy`: When an SSL is generated, files are stored here by Caddy.
- `/etc/Caddyfile`: If you intend to include your own Caddyfile, mount it here.
- `/etc/ssmtp/ssmtp.conf `: If you intend to use PHP's mail() function, configure this file.
- `/etc/ssmtp/revaliases`: Another configuration file for ssmtp

## Caddy Extensions:

- git
- ipfilter

## PHP Extensions:

- composer
- php7-fpm
- ... and a bunch of others.  Read the Dockerfile.

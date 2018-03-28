![](https://withsocial.com/assets/img/logo/withsocial.black.black.72ppi.png)

# WithSocial Laravel CI Builds

Run CI builds on your php/laravel applications with this repo which includes everything you need for standard/advanced Laravel tests. PHP 7.0-latest, Git, Composer, SQLite and any packages you need.

### Available PHP Versions
* 7.0
* 7.1
* 7.2

### Example usage with GitLab's `.gitlab-ci.yml`
```yml
# PHP 7.1
test:php7.1:
  image: bashy/docker-build:php71
  script:
  - vendor/bin/parallel-lint --exclude vendor --exclude _ide_helper.php .
  - vendor/bin/phpunit
  - vendor/bin/phpmd app/ text phpmd.xml
  - vendor/bin/phpcs --standard=psr2 app

# PHP 7.2
test:php7.2:
  image: bashy/docker-build:php72
  script:
  - vendor/bin/parallel-lint --exclude vendor --exclude _ide_helper.php .
  - vendor/bin/phpunit
  - vendor/bin/phpmd app/ text phpmd.xml
  - vendor/bin/phpcs --standard=psr2 app
```

### If you want to use the latest stable PHP version, just use :latest
```yml
# PHP Latest
test:php-latest:
  image: bashy/docker-build:latest
  script:
  - vendor/bin/parallel-lint --exclude vendor --exclude _ide_helper.php .
  - vendor/bin/phpunit
  - vendor/bin/phpmd app/ text phpmd.xml
  - vendor/bin/phpcs --standard=psr2 app
```

### Info 
I believe there's easier ways to install the services separately but for now this works and we have full control over what it does.

### Contributing
Pull requests are welcome but please explain what it fixes/solves/changes clearly for me.



Docket Hub Link: https://hub.docker.com/r/bashy/docker-build/


Thanks!

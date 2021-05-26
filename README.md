# WithSocial Laravel CI Builds

Run CI builds on your php/laravel applications with this repo which includes everything you need for standard/advanced Laravel tests. Ranging from PHP 7.2 to the latest version + Git, Composer, SQLite and any packages you need.

### Available PHP Versions
* 7.3
* 7.4
* latest

### Example usage with GitLab's `.gitlab-ci.yml`
```yml
# PHP 7.3
test:php7.3:
  image: bashy/docker-build:php73
  script:
  - vendor/bin/parallel-lint --exclude vendor --exclude _ide_helper.php .
  - vendor/bin/phpunit
  - vendor/bin/phpmd app/ text phpmd.xml
  - vendor/bin/phpcs --standard=psr2 app

# PHP 7.4
test:php7.4:
  image: bashy/docker-build:php74
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

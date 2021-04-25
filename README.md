# symfony-docker
A docker stack pattern for symfony. It uses:
 * Symfony 5.2
 * PHP 8.0
 * symfony cli
 * composer

## Installation

Put your Symfony project inside `app/` and `make up`, or run
```
make init
```
to initialize a new Symfony skeleton project.

Access your running project at http://localhost:8000 🎉

## Using `symfony` and `composer`

You can use the tools from within the app container. Get inside via
```
make bash
```

## Acknowledgements

https://github.com/eko/docker-symfony offers a more comprehensive stack, including nginx and
log analysis tools. 
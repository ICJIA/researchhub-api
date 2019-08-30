# ICJIA Research Hub API

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> This project was supported by State Justice Statistics (SJS) Program Grant #2018-86-CX-K006, awarded to the Illinois Criminal Justice Information Authority by the U.S. Department of Justice Office of Justice Programs' Bureau of Justice Statistics.

Containerized API server for ICJIA Research Hub contents.

**Powered by** [<img src="https://goto.docker.com/rs/929-FJL-178/images/Docker%20Horizontal%20Large.png" height="25">](https://www.docker.com/) [<img src="https://camo.githubusercontent.com/df21cbd8be3b9cb0143244035d768cdd077b0a33/68747470733a2f2f626c6f672e7374726170692e696f2f636f6e74656e742f696d616765732f323031372f31302f6c6f676f2e706e67" height="25" />](https://strapi.io/)

## Project Setup

### Specify ports to use

```
# .env
PORT_DEVELOPMENT=
PORT_PRODUCTION=
PORT_DB=
```

### Scaffold the API server

```sh
docker-compose up  # add '-d' flag to use detached mode
```

## Credits

- [strapi/strapi-docker](https://github.com/strapi/strapi-docker)
- [vishnubob/wait-for-it](https://github.com/vishnubob/wait-for-it)

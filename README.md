# taglog
Log with tags

# Installation
Install with npm.

```shell
npm install --save taglog
```

# Examples

```coffeescript
log = require('taglog')("TAG")

log.i "hello, world"
# => I/10:33:14:9420[TAG] hello, world
```

# API

## Logging Levels
Supports five levels: `debug`, `verbose`, `info`, `warn`, error.

## Create Logger

### taglog(tag)
* `tag` is a {String}

## Methods
### log.level(level)
Set the minimum log level. Default is `info`. Logs more verbose that the set level will be omitted.

### log.<level>(item[, item...])
* `item` One or more items of any time
Logs the supplied items at the specified level

*Aliases:*
* log.debug()
* log.d()
* log.verbose()
* log.v
* log.info()
* log.i()
* log.warn()
* log.w()
* log.error()
* log.e()


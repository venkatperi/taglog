moment = require 'moment'
replacer = ( k, v ) ->
  return '[Function]' if typeof v is 'function'
  v

levels =
  debug : 0
  verbose : 1
  info : 2
  warn : 3
  error : 4
  fatal : 5

logLevel = 'info'

log = ( level, tag ) -> ( items... ) ->
  return if levels[ level ] < levels[ logLevel ]
  msgs = for item in items
    if typeof item is 'object' then JSON.stringify item, replacer else item
  l = level[ 0 ].toUpperCase()
  time = moment().format 'hh:mm:ss:SSSS'
  console.log "#{l}/#{time}[#{tag}] #{msgs.join ' '}"

log.level = 'info'

module.exports = ( tag ) ->
  ret =
    level : ( l ) -> logLevel = l

  for own l,v of levels
    ret[l] = ret[l[0]] = log l, tag
  ret

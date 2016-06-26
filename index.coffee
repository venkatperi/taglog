moment = require 'moment'
whatClass = require 'what-class'
prettyjson = require 'prettyjson'
os = require 'os'
colors = require('colors/safe')
seqx = require 'seqx'

levels =
  debug :
    level : 0
    color : 'blue'
  verbose :
    level : 1
    color : 'cyan'
  info :
    level : 2
    color : 'green'
  warn :
    level : 3
    color : 'yellow'
  error :
    level : 4
    color : 'red'

logLevel = 'info'
useColors = true

seq = seqx()

color = ( x, level ) ->
  return x unless useColors
  colors[ levels[ level ].color ](x)

jsonColors =
  keysColor : 'grey'
  dashColor : 'white'
  stringColor : 'white'

pretty = ( obj ) ->
  x = if useColors then jsonColors else  { noColor : true }
  prettyjson.render obj, x

_toStr = ( obj ) ->
  switch whatClass obj
    when 'Object'
      os.EOL + pretty obj
    when 'Function'
      '[Function]'
    else
      obj

toStr = _toStr

log = ( level, tag ) -> ( items... ) ->
  seq.add -> _log level, tag, items...

_log = ( level, tag, items... ) ->
  return if levels[ level ].level < levels[ logLevel ].level
  list = for item in items
    txt = toStr item, level
    unless whatClass(item) is 'Object'
      txt = color txt, level
    txt

  l = level[ 0 ].toUpperCase()
  time = moment().format 'hh:mm:ss:SSSS'
  t = color "#{l}/#{time}[#{tag}]", level
  msg = list.join ' '
  x = t + ' ' + msg
  console.log x
  x

module.exports = ( tag ) ->
  ret =
    level : ( l ) -> logLevel = l
    colors : ( flag ) -> useColors = flag
    str : ( f ) -> toStr = f

  for own l,v of levels
    ret[ l ] = ret[ l[ 0 ] ] = log l, tag
  ret

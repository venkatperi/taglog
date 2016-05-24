should = require 'should'
log = require('../index')("TAG")

describe 'logger', ->

  it 'should log', ->
    log.i "hello, world"



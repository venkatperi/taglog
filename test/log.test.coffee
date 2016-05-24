should = require 'should'
assert = require 'assert'
log = require('../index')("TAG")

describe 'logger', ->

  describe 'log level: debug', ->
    before -> log.level 'debug'
    it 'debug', -> assert log.d("hello, world").length != 0
    it 'verbose', -> assert log.v("hello, world").length != 0
    it 'info', -> assert log.i("hello, world").length != 0
    it 'warn', -> assert log.w("hello, world").length != 0
    it 'error', -> assert log.e("hello, world").length != 0

  describe 'log level: verbose', ->
    before -> log.level 'verbose'
    it 'debug', -> should(log.d("hello, world")).not.exist
    it 'verbose', -> assert log.v("hello, world").length != 0
    it 'info', -> assert log.i("hello, world").length != 0
    it 'warn', -> assert log.w("hello, world").length != 0
    it 'error', -> assert log.e("hello, world").length != 0

  describe 'should log objects', ->
    before -> log.level 'info'
    it 'log object', -> log.i 'package.json', require '../package.json'
 
  describe 'no colors', ->
    before -> log.colors false 
    it 'log object', -> log.i 'package.json', require '../package.json'
 



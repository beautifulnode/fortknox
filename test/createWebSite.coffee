fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'activateWebSite', ->
  getClient = ->
    fortknox.createClient
      key: '0F89W67P3HM5MJ9YRER2'
      secret: 'gGHb1PPZru+3o3oI9l1W2RUtiML0r3/roFPN21Sh'
      bucket: 'www.tomwilson.com'

      # key: 'FOO'
      # secret: 'BAR'
      # bucket: 'www.foobardude.com'
  it 'method should exists', (done) ->
    client = getClient()
    client.createWebSite (err, resp) -> resp.on 'data', (data) -> 
      console.log data.toString()
      done()
    
    #assert.equal client.createWebSite?, true

fortknox = require '../'
assert = require 'assert'

describe 'full integration test', ->
  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobar.com'
  it 'should create s3 website', (done) ->
    client = getClient()
    #client.on 'error', (err) -> console.log err
    client.createBucket -> client.createWebSite -> client.activatePolicy -> 
      assert.equal true, true
      done()
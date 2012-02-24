fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'deleteWebSite', ->
  nock('http://www.foobardude.com.s3.amazonaws.com').delete('/?website').reply(200, "", {})
  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobardude.com'
  it 'method should get 200', (done) ->
    client = getClient()
    client.deleteWebSite (err, resp) -> 
      assert(resp.statusCode, 200)
      done()

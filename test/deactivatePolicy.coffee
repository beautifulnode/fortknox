fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'deactivatePolicy', ->
  nock('http://www.foobardude.com.s3.amazonaws.com').delete('/?policy')
    .reply(403, "", { })
  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobardude.com'
  it 'method should get 200', (done) ->
    client = getClient()
    client.deactivatePolicy (err, resp) -> 
      assert(resp.statusCode, 200)
      done()

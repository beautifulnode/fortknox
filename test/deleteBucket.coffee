fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'createBucket', ->
  nock("http://www.foobar.com.s3.amazonaws.com").delete("/").reply 200, "", {}

  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobar.com'
  it 'method should exists', ->
    client = getClient()
    assert.equal client.deleteBucket?, true
  it 'should call create bucket', (done) ->
    client = getClient()
    client.deleteBucket (err, resp) -> 
      assert.equal resp.statusCode, 200
      done()
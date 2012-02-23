fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'createBucket', ->
  nock("http://www.foobar.com.s3.amazonaws.com").put("/").reply 200, "", 
    'x-amz-id-2': 'q6yhYf5H92KUtyCjQ4aAwBWMREfHsDtDpVfPFpglHFpin2crOs3PGHq7ZtbvSkge',
    'x-amz-request-id': '92F09D01D33FE4F0',
    date: 'Wed, 22 Feb 2012 02:18:40 GMT',
    location: '/www.foobar.com',
    'content-length': '0',
    server: 'AmazonS3' 

  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobar.com'
  it 'method should exists', ->
    client = getClient()
    assert.equal client.createBucket?, true
  it 'should call create bucket', (done) ->
    client = getClient()
    client.createBucket (err, resp) -> 
      assert.equal resp.statusCode, 200
      done()
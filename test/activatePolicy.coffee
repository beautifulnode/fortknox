fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'createWebSite', ->
  nock('http://www.foobardude.com.s3.amazonaws.com').put('/?policy', "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Sid\":\"PublicReadGetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::www.foobardude.com/*\"}]}")
    .reply(200, "", {})
  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobardude.com'
  it 'method should get 200', (done) ->
    client = getClient()
    client.activatePolicy (err, resp) -> 
      assert(resp.statusCode, 200)
      done()

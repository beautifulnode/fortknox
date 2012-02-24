fortknox = require '../'
assert = require 'assert'
nock = require 'nock'

describe 'createWebSite', ->
  nock('http://www.foobardude.com.s3.amazonaws.com').put('/?website', "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<WebsiteConfiguration xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">\n  <IndexDocument>\n    <Suffix>index.html</Suffix>\n  </IndexDocument>\n  <ErrorDocument>\n    <Key>404.html</Key>\n  </ErrorDocument>\n</WebsiteConfiguration>")
    .reply(200, "", {})
  getClient = ->
    fortknox.createClient
      key: 'FOO'
      secret: 'BAR'
      bucket: 'www.foobardude.com'
  it 'method should get 200', (done) ->
    client = getClient()
    client.createWebSite (err, resp) -> 
      assert.equal(resp.statusCode, 200)
      done()

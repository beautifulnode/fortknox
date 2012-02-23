knox = require 'knox'
#
# createBucket from client.options.
# 
# @param {Function} fn
# @api public
knox.prototype.createBucket = (fn) ->
  req = this.put '/', {}
  req.on 'response', (resp) -> fn null, resp
  req.end()

# deleteBucket from client.options.
# 
# @param {Function} fn
# @api public
knox.prototype.deleteBucket = (fn) ->
  req = this.del '/', {}
  req.on 'response', (resp) -> fn null, resp
  req.end()

# createWebsite from client.options.
# 
# @param {Function} fn
# @api public
knox.prototype.createWebSite = (fn) ->
  req = this.request 'PUT', '/?website', {}
  req.on 'response', (resp) -> fn null, resp
  req.write """
<?xml version="1.0" encoding="UTF-8"?>
<WebsiteConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <IndexDocument>
    <Suffix>index.html</Suffix>
  </IndexDocument>
  <ErrorDocument>
    <Key>404.html</Key>
  </ErrorDocument>
</WebsiteConfiguration>
    """
  req.end()

# createWebsite from client.options.
# 
# @param {Function} fn
# @api public
knox.prototype.deleteWebSite = (fn) ->
  req = this.request 'DELETE', '/?website', {}
  req.on 'response', (resp) -> fn null, resp
  req.end()

# activatePolicy from client.options.
# 
# @param {Function} fn
# @api public
knox.prototype.activatePolicy = (fn) ->
  req = this.request 'PUT', '/?policy', {}
  req.on 'response', (resp) -> fn null, resp
  req.write JSON.stringify
    "Version": "2008-10-17"
    "Statement": [
      "Sid": "PublicReadGetObject"
      "Effect": "Allow"
      "Principal": { "AWS": "*" }
      "Action": "s3:GetObject"
      "Resource": "arn:aws:s3:::#{this.bucket}/*"
    ]
  req.end()

# deactivatePolicy from client.options.
# 
# @param {Function} fn
# @api public
knox.prototype.deactivatePolicy = (fn) ->
  req = this.request 'DELETE', '/?policy', {}
  req.end()

module.exports = knox
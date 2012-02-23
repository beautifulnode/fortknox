var knox;

knox = require('knox');

knox.prototype.createBucket = function(fn) {
  var req;
  req = this.put('/', {});
  req.on('response', function(resp) {
    return fn(null, resp);
  });
  return req.end();
};

knox.prototype.deleteBucket = function(fn) {
  var req;
  req = this.del('/', {});
  req.on('response', function(resp) {
    return fn(null, resp);
  });
  return req.end();
};

knox.prototype.createWebSite = function(fn) {
  var req;
  req = this.request('PUT', '/?website', {});
  req.on('response', function(resp) {
    return fn(null, resp);
  });
  req.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<WebsiteConfiguration xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">\n  <IndexDocument>\n    <Suffix>index.html</Suffix>\n  </IndexDocument>\n  <ErrorDocument>\n    <Key>404.html</Key>\n  </ErrorDocument>\n</WebsiteConfiguration>");
  return req.end();
};

knox.prototype.deleteWebSite = function(fn) {
  var req;
  req = this.request('DELETE', '/?website', {});
  req.on('response', function(resp) {
    return fn(null, resp);
  });
  return req.end();
};

knox.prototype.activatePolicy = function(fn) {
  var req;
  req = this.request('PUT', '/?policy', {});
  req.on('response', function(resp) {
    return fn(null, resp);
  });
  req.write(JSON.stringify({
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::" + this.bucket + "/*"
      }
    ]
  }));
  return req.end();
};

knox.prototype.deactivatePolicy = function(fn) {
  var req;
  req = this.request('DELETE', '/?policy', {});
  return req.end();
};

module.exports = knox;

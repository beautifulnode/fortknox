# FortKnox

Enhancement methods to Knox the AWS s3 module, with these methods you can create a bucket, remove a bucket, create a website and activate a standard website policy.

## Install

``` sh
npm install fortknox
```

## Api Methods

Fort Knox supports all methods that knox supports and adds the following
methods:

* createBucket
* deleteBucket
* createWebsite
* deleteWebsite
* enablePolicy
* disablePolicy

---

### fortknox.createBucket *createBucket(fn)*

fortknox.createBucket builds a new bucket based on your client options.

``` coffeescript
fortknox = require 'fortknox'

client = fortknox.createClient
  key: 'FOO'
  secret: 'BAR'
  bucket: 'www.foobar.com'

client.createBucket (err, resp) -> console.log resp.statusCode
```

### fortknox.deleteBucket *deleteBucket(fn)*

fortknox.deleteBucket removes a bucket based on your client options.

``` coffeescript
fortknox = require 'fortknox'

client = fortknox.createClient
  key: 'FOO'
  secret: 'BAR'
  bucket: 'www.foobar.com'

client.deleteBucket (err, resp) -> console.log resp.statusCode
```

### fortknox.createWebSite *createWebSite(fn)*

fortknox.createWebSite convert bucket into a website.

``` coffeescript
fortknox = require 'fortknox'

client = fortknox.createClient
  key: 'FOO'
  secret: 'BAR'
  bucket: 'www.foobar.com'

client.createWebSite (err, resp) -> console.log resp.statusCode
```

### fortknox.deleteWebSite *deleteWebSite(fn)*

fortknox.deleteWebSite remove website config from a bucket.

``` coffeescript
fortknox = require 'fortknox'

client = fortknox.deleteWebSite
  key: 'FOO'
  secret: 'BAR'
  bucket: 'www.foobar.com'

client.deleteWebSite (err, resp) -> console.log resp.statusCode
```
### fortknox.activatePolicy *activatePolicy(fn)*

fortknox.activatePolicy activate policy config from a bucket.

``` coffeescript
fortknox = require 'fortknox'

client = fortknox.activatePolicy
  key: 'FOO'
  secret: 'BAR'
  bucket: 'www.foobar.com'

client.activatePolicy (err, resp) -> console.log resp.statusCode
```

### fortknox.deactivatePolicy *deactivatePolicy(fn)*

fortknox.deactivatePolicy activate policy config from a bucket.

``` coffeescript
fortknox = require 'fortknox'

client = fortknox.deactivatePolicy
  key: 'FOO'
  secret: 'BAR'
  bucket: 'www.foobar.com'

client.deactivatePolicy (err, resp) -> console.log resp.statusCode
```

## Testing

``` sh
npm test
```

## Contribute

Pull Requests welcome!

## Thanks to

* [visionmedia](http://github.com/visionmedia) for creating knox
# FortKnox

Enhancement module to Knox the AWS s3 module

Fort Knox supports all methods that knox supports and adds the following
methods:

* createBucket
* deleteBucket
* createWebsite
* deleteWebsite
* enablePolicy
* disablePolicy

---

# fortknox.createBucket createBucket(fn)

fortknox.createBucket builds a new bucket based on your create client options.

``` coffeescript
require('coffee-script');
var coffeecup = require('coffeekup');

console.log coffeecup.render -> h1 'Foo'
`

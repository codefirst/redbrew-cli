Redbrew - A missing Redmine plugin manager
====================================
A client for [Redbrew](http://redbrew.heroku.com/).

Commands
----------------

 * install <plugin_id>   - install specified plugin
 * search  <keyword>     - search plugins with specified keyword
 * reboot  <server\_type> - reboot Redmine (supporting server_type is 'passenger')
 * version               - show Redbrew's version
 * help                  - show help message

How to build
----------------

    $ bundle install --path vendor/bundle
    $ gem build redbrew.gemspec

How to test
----------------

    $ bundle install --path vendor/bundle
    $ bundle exec rake spec

Authors
----------------
 * @suer
 * @mallowlabs

License
------------------------------
The MIT License (MIT)
Copyright (c) 2012 codefirst.org

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


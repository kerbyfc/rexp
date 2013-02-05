Rexp <font size="2">0.0.1</font>
========= 

** make regexp from minimatch string or regexp string **

### Installation

    $ npm install -g rexp

### CLI usage

    $ rexp './**/*'
    /^\.\/(?:(?!(?:\/|^)\.).)*?\/(?!\.)(?=.)[^/]*?$/

    $ rexp 'r/myRegexp$/i'
    /myRegexp/i


### Programmatically usage

      require('rexp').create('./**/*', {}) === /^\.\/(?:(?!(?:\/|^)\.).)*?\/(?!\.)(?=.)[^/]*?$/


### Options
    
  see [minimatch options]

    var rexp = require('rexp')
    var options = _.extend({}, rexp.defaults, {dot: true})
    rexp.create('./**/*', options)

[minimatch options]: https://github.com/isaacs/minimatch#options
minimatch = require 'minimatch'

class Rexp 

  defaults:
    dot: false

  shutdown: (msg) ->
    console.error msg; process.exit(0)

  create: ( pattern, options = {}) ->

    # just return RegExp object if he was passed
    if pattern instanceof RegExp or pattern is null
      return pattern

    # create RegExp from string
    else if typeof pattern is 'string'

      return null unless pattern.length

      # try to create RegExp from string
      try

        # if string looks like regexp
        if pattern.match( /^r\/.*\/([igm]*)?$/ )? and (fIndex = pattern.lastIndexOf('/'))
          return new RegExp pattern.substr( 2, fIndex-3), pattern.substring(fIndex+1)

        # create with minimatch
        else
          # new Minimatch object
          return minimatch.makeRe pattern, options

      # something went wrong
      catch e
        @shutdown "Pattern `#{pattern}` is invalid. #{e.message}"

    # invalid pattern type
    else
      @shutdown "Expected <string> minimatch pattern or r/<regexp string>/<regexp flags>. <#{typeof pattern}> #{pattern} given"

module.exports = new Rexp
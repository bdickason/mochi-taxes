### Tests for Database /lib/db.coffee ###

cfg = require '../cfg/config.js'
should = require 'should'
Db = (require '../lib/db.js').Db

### Initialize DB ###
db = new Db cfg
    
describe 'Connect to MySQL server', ->
  it 'Should return a basic query', (done) ->
    db.test (err, callback) ->
      # Stub data
      sampleRow = JSON.stringify {'1': 1}

      should.not.exist err      
      JSON.stringify(callback[0]).should.equal sampleRow      
      done()


### Tests for Sales Tax by Quarter ###

cfg = require '../cfg/config.js'
should = require 'should'
Db = (require '../lib/db.js').Db

### Initialize DB ###
db = new Db cfg

### Constants ###
serviceTaxRate = 0.045
retailTaxRate = 0.08875

### 2012 ###

# Q2 2012

describe 'Q2 2012 (Jun 1 2012 - Aug 31 2012)', ->
  it 'Total should equal $', (done) ->
    
    ###
    # within $10.00
    startDate = "2012-06-01"
    endDate = "2012-08-31"  # When set this to 2012-08-31, we get within $10.00
    giftCards = false
    voided = true
    earlyPayment = true ###
    
    # exactly $200 off (early payment?!)
    startDate = "2012-06-01"
    endDate = "2012-09-01"  # When set this to 2012-08-31, we get within $10.00
    giftCards = true
    voided = true
    # earlyPayment = true
    
    serviceTotal = 154196.00
    retailTotal = 18231.95
    taxTotal = 8556.91

    db.getTaxByQuarter startDate, endDate, giftCards, voided, (err, callback) ->
      should.not.exist err
      should.exist callback
      
      rows = callback
      rows[0].type.should.equal 'service'
      rows[0].total.should.equal serviceTotal
      rows[1].type.should.equal 'product'
      rows[1].total.should.equal retailTotal
      
      tax = Math.round(((rows[0].total * serviceTaxRate) + (rows[1].total * retailTaxRate))*100)/100
      taxTotal.should.equal tax
      
      done()


# Q3 2012
describe 'Q3 2012 (Sep 1 2012 - Nov 30 2012)', ->  
  it 'Total should equal $', (done) ->
    startDate = "2012-09-01"
    endDate = "2012-12-01"
    giftCards = true  # This is the first month we started keeping track of gift cards
    voided = true
    # earlyPayment = true
    
    serviceTotal = 139923.05
    retailTotal = 18097.60
    taxTotal = null
    
    db.getTaxByQuarter startDate, endDate, giftCards, voided, (err, callback) ->
      should.not.exist err
      should.exist callback
      
      rows = callback
      rows[0].type.should.equal 'service'
      rows[0].total.should.equal serviceTotal
      rows[1].type.should.equal 'product'
      rows[1].total.should.equal retailTotal
      
      done()


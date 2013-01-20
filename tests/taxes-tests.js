// Generated by CoffeeScript 1.4.0

/* Tests for Sales Tax by Quarter
*/


(function() {
  var Db, cfg, db, should;

  cfg = require('../cfg/config.js');

  should = require('should');

  Db = (require('../lib/db.js')).Db;

  /* Initialize DB
  */


  db = new Db(cfg);

  describe('Q3 2012 (Sep 1 2012 - Nov 30 2012)', function() {
    return it('Total should equal $', function(done) {
      var endDate, giftCards, startDate;
      startDate = "2012-09-01";
      endDate = "2012-12-01";
      giftCards = true;
      return db.getTaxByQuarter(startDate, endDate, giftCards, function(err, callback) {
        var rows;
        should.not.exist(err);
        should.exist(callback);
        rows = callback;
        rows[0].type.should.equal('service');
        rows[0].total.should.equal(139923.05);
        rows[1].type.should.equal('product');
        rows[1].total.should.equal(18097.60);
        return done();
      });
    });
  });

}).call(this);
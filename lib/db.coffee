### Data models and interface with Mysql ###
Mysql = require 'mysql'
cfg = require '../cfg/config.js'

exports.Db = class Db
  constructor: (cfg) ->
    # Start up Mysql
    @mysql = Mysql.createConnection {
      host: "#{cfg.DB_HOSTNAME}",
      port: "#{cfg.DB_PORT}"
      user: "#{cfg.DB_USERNAME}",
      password: "#{cfg.DB_PASSWORD}",
      database: "#{cfg.DB_DATABASE}"
    }
    
    @mysql.connect (err) ->
      if err
        console.log "Error: " + err
      
  test: (callback) ->
    @mysql.query "SELECT 1", (err, rows) ->
      console.log "Error: " + err
      callback err, rows

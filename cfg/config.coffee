### Configuration file - Set your MySQL info here ###

# Server Setup
exports.HOSTNAME = process.env.HOSTNAME || 'localhost'
exports.PORT = process.env.PORT || '3000'

# Mysql Setup
exports.DB_HOSTNAME = process.env.DB_HOSTNAME || 'localhost'
exports.DB_PORT = process.env.DB_PORT || '3307'
exports.DB_USERNAME = process.env.DB_USERNAME || ''
exports.DB_PASSWORD = process.env.DB_PASSWORD || ''
exports.DB_DATABASE = process.env.DB_DATABASE || ''
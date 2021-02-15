const { environment, merge } = require('@rails/webpacker');
const customConfig = require('./custom');

// const { webpackConfig, merge } = require('@rails/webpacker')

environment.config.resolve.extensions.push('.jsx')
// console.log("here",environment)


module.exports = environment

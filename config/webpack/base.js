const { webpackConfig, merge } = require('@rails/webpacker')

webpackConfig.resolve.extensions.push('.jsx')

module.exports = merge(webpackConfig, customConfig)
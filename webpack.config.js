const webpack = require('webpack');
const path = require('path');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
const autoprefixer = require("autoprefixer");

const extractSass = new ExtractTextPlugin({
  filename: "css/[name].css",
  disable: process.env.NODE_ENV === "development"
})

module.exports = {
  entry: {
    application: './assets/js/index.js',
    styles: './assets/sass/application.sass'
  },
  resolve: {
    modules: [
      path.join(__dirname, 'assets/js'),
      "node_modules"
    ],
    alias: {
      modernizr$: path.resolve(__dirname, ".modernizrrc.js")
    }
  },
  output: {
    path: path.resolve(__dirname, (process.env.NODE_ENV === "development") ? './src/assets' : '../build/assets'),
    filename: 'js/[name].js',
    publicPath: '/assets'
  },
  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        uglifyOptions: {
          warnings: false,
          compress: true,
          comments: false,
        }
      })
    ]
  },
  module: {
    rules: [
      {
        loader: "webpack-modernizr-loader",
        test: /\.modernizrrc\.js$/
      },
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        enforce: 'pre',
        test: /\.s[ac]ss/,
        use: 'import-glob-loader'
      },
      {
        test: /\.s[ac]ss$/,
        use: extractSass.extract({
          use: [
            { loader: "css-loader" },
            {
              loader: 'postcss-loader',
              options: {
                plugins: () => [autoprefixer()]
              }
            },
            { loader: "sass-loader" }
          ],
          fallback: "style-loader"
        })
      }
    ]
  },
  plugins: [
    extractSass,
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify(process.env.NODE_ENV),
      }
    }),
    new webpack.ProvidePlugin({
      $: "jquery", // Used for Bootstrap JavaScript components
      jQuery: "jquery", // Used for Bootstrap JavaScript components
      Popper: ['popper.js', 'default'] // Used for Bootstrap dropdown, popup and tooltip JavaScript components
    })
  ]
};

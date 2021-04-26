const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './src/index.tsx',
  mode: 'development',
  output: {
    filename: "index.js",
    path: path.resolve(__dirname, "../dist/app"),
    clean: true,
    publicPath: '/',
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'public/index.html'
    })
  ],
  module: {
    rules: [
      {
        test: /\.ts|\.tsx$/,
        loader: "ts-loader",
        exclude: /node_modules/,
        sideEffects: false
      }
    ]
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js"]
  },
  devtool: 'inline-source-map',
  devServer: {
    contentBase: '../dist/app',
    historyApiFallback: true,
    proxy: {
      '/graph': 'http://localhost:666'
    }
  }

}


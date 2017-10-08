echo "🐙 \033[1;34m Criando Webpack DEV para $theme \033[0m"

echo "
const webpack = require('webpack');
const glob = require('glob');
const path = require('path');
const CommonsPlugin = require('webpack/lib/optimize/CommonsChunkPlugin');

const HtmlWebpackPlugin = require('html-webpack-plugin');

const ExtractTextPlugin = require('extract-text-webpack-plugin');
const PurifyCSSPlugin = require('purifycss-webpack');

const siteTheme = require('../_scripts/gulp/theme').theme;



module.exports = {
    entry: {
        main: path.resolve(__dirname, '../_theme/'+ siteTheme +'/main.js'),
    },
    output: {
        //plugin pare resolver path relativo
        path: path.resolve(__dirname, '../_theme/'+ siteTheme +'/assets/'),
        filename: '[name].js'
    },
    module: {
        rules: [
            {
                test: /\.(scss|css)$/,
                use: ExtractTextPlugin.extract({
                        fallback: 'style-loader',
                        use: [
                            { loader: 'css-loader', options: { minify: false } },
                            {loader: 'autoprefixer-loader'},
                            {loader: 'postcss-loader', options: { config: { path: './_config/postcss.config.js' }}},
                            { loader: 'sass-loader' }
                        ],
                        publicPath: ''
                    }) //extract text
            },
            { test: /\.js$/, exclude: /node_modules/, loader: 'babel-loader' },
            {
                test: /\.(jpe?g|png|gif)$/,
                use: [
                    { loader: 'file-loader?name=[name].[ext]&outputPath=img/' },
                    {
                        loader: 'image-webpack-loader',
                        query: {
                            progressive: true,
                            pngquant: {
                                quality: '65-90',
                                speed: 4
                            },
                            gifsicle: {
                                interlaced: false
                            },
                            // svgo:{},
                            mozjpeg: {
                                progressive: true,
                                optimizationLevel: 7,
                            }
                        }
                    }
                ]
            },
            { test: /\.(woff2?|svg)$/, loader: 'url-loader?limit=10000' },
            { test: /\.(ttf|eot)$/, loader: 'file-loader' }
            
        ]
    },
    
    plugins: [
        new ExtractTextPlugin({
            filename: '[name].css',
            // disable: !isProd, //if it's not production - disable in dev mode
            allChunks: true
        }),
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery',
            'window.jQuery': 'jquery',

        }),
       
        // new PurifyCSSPlugin({
        //     // Give paths to parse for rules. These should be absolute!
        //     paths: glob.sync(path.join(__dirname, '_theme/**/**/*.html'))
        // }),
        // new PurifyCSSPlugin({
        //     // Give paths to parse for rules. These should be absolute!
        //     paths: glob.sync(path.join(__dirname, '_content/**/**/*.html'))
        // }),

        new CommonsPlugin({
            minChunks: 3,
            name: 'common'
        }),
    ],
};
" >> _config/webpack.dev.config.js

echo "🐙 \033[1;34m Webpack DEV done!!! \033[0m"

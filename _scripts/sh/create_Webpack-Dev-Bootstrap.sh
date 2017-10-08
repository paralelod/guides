cat >  _config/webpack.dev.config.js <<- 'EOF'
const webpack = require('webpack');
const glob = require('glob');
const path = require('path');
const CommonsPlugin = require("webpack/lib/optimize/CommonsChunkPlugin");

const HtmlWebpackPlugin = require('html-webpack-plugin');

const ExtractTextPlugin = require("extract-text-webpack-plugin");
const PurifyCSSPlugin = require('purifycss-webpack');


const config = require('../_scripts/gulp/theme').theme;


const bootstrapEntryPoints = require('./webpack.bootstrap.config');


module.exports = {
    entry: {
        main: './_theme/'+ config +'/main.js',
        bootstrap: bootstrapEntryPoints.prod
    },
    output: {
        //plugin pare resolver path relativo
        path: path.resolve(__dirname, '_theme/'+ config +'/assets/'),
        filename: '[name].js'
    },
    module: {
        rules: [

            {
                test: /\.scss$/,
                use: ExtractTextPlugin.extract({
                        fallback: "style-loader",
                        use: [
                            { loader: "css-loader", options: { minify: false } },
                            {loader: 'autoprefixer-loader'},
                            {loader: 'postcss-loader', options: { config: { path: './_config/postcss.config.js' }}},
                            { loader: "sass-loader" }

                        ],
                        publicPath: ''
                    }) //extract text
            },
            { test: /\.js$/, exclude: /node_modules/, loader: "babel-loader" },
            {
                test: /\.(jpe?g|png|gif)$/,
                use: [
                    { loader: "file-loader?name=[name].[ext]&outputPath=img/" },
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
            { test: /\.(ttf|eot)$/, loader: 'file-loader' },
            { test: /bootstrap[\/\\]dist[\/\\]js[\/\\]umd[\/\\]/, loader: 'imports?jQuery=jquery,$=jquery,this=>window' },
        ]
    },
    
    plugins: [
        new ExtractTextPlugin({
            filename: "[name].css",
            // disable: !isProd, //if it's not production - disable in dev mode
            allChunks: true
        }),
        new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            'window.jQuery': 'jquery',

        }),
        new webpack.ProvidePlugin({
            Tether: "tether",
            "window.Tether": "tether",
            Tooltip: "exports-loader?Tooltip!bootstrap/js/dist/tooltip",
            Alert: "exports-loader?Alert!bootstrap/js/dist/alert",
            Button: "exports-loader?Button!bootstrap/js/dist/button",
            Carousel: "exports-loader?Carousel!bootstrap/js/dist/carousel",
            Collapse: "exports-loader?Collapse!bootstrap/js/dist/collapse",
            Dropdown: "exports-loader?Dropdown!bootstrap/js/dist/dropdown",
            Modal: "exports-loader?Modal!bootstrap/js/dist/modal",
            Popover: "exports-loader?Popover!bootstrap/js/dist/popover",
            Scrollspy: "exports-loader?Scrollspy!bootstrap/js/dist/scrollspy",
            Tab: "exports-loader?Tab!bootstrap/js/dist/tab",
            Tooltip: "exports-loader?Tooltip!bootstrap/js/dist/tooltip",
            Util: "exports-loader?Util!bootstrap/js/dist/util",
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
            name: "common"
        }),
    ]
};

EOF

file -I  _config/webpack.dev.config.js
echo "encoding " _config/webpack.dev.config.js" ("us-ascii") to utf-8"

echo "🐙 \033[1;34m BootstrapRC done!!! \033[0m"
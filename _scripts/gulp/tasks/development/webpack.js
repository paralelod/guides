var gulp = require('gulp');
var shell = require('gulp-shell');

gulp.task('webpack',shell.task(['webpack --config _config/webpack.dev.config.js']));

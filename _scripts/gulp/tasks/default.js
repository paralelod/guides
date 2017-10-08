var gulp = require('gulp');
var runSequence = require('run-sequence');

gulp.task('default', function() {
    runSequence(
        'data-clean',
        'webpack',
        // 'webpack-mdl',
        // 'webpack-bootstrap',
        'yamlDev',
        'hologram',
        'jekyll',
        'data-jekyll',
        'watch'
    );
});
gulp.task('dev', function() {
    runSequence(
        'data-clean',
        'webpack',
        // 'webpack-mdl',
        // 'webpack-bootstrap',
        'yamlDev',
        'hologram',
        'jekyll',
        'data-jekyll',
        'watch'
    );
});
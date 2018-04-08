var gulp = require('gulp');
var clean = require('gulp-clean');
var shell = require('gulp-shell');
var browserSync = require('browser-sync').create();


gulp.task('clean', function () {
    return gulp.src('_site/', {read: false})
        .pipe(clean());
});

gulp.task('jekyll', shell.task(['bundle exec jekyll build --config "_config.yml,_config.dev.yml"']));

gulp.task('jekyll-rebuild', ['jekyll'], function () {
    browserSync.reload();
});

gulp.task('serve', function () {
    browserSync.init({
        logConnections: true,
        https: true,
        server: {
            baseDir: '_site/',
            
        }
    });
    // Reloads page when some of the already built files changed:
    gulp.watch('_site/**/*.*').on('change', browserSync.reload);
    gulp.watch([
        '_config.yml',
        '_config.dev.yml',
        './**/**/**/*.html',
        './**/**/*.md',
        './**/**/*.scss',
        '!./_site/', 
    ],
    ['jekyll-rebuild']);
});

gulp.task('default', 
    [
        'clean',
        'jekyll', 
        'serve'
    ]
);
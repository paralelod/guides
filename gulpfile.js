const gulp = require('gulp');
const clean = require('gulp-clean');
const concat = require('gulp-concat');
const uglify = require('gulp-uglify');
const shell = require('gulp-shell');
const browserSync = require('browser-sync').create();

gulp.task('clean-scripts', function () {
    return gulp.src('./assets/script.js', {read: false})
      .pipe(clean());
  });

gulp.task('scripts', function() {
    return gulp.src('./_assets/js/*.js')
      .pipe(concat('script.js'))
      .pipe(uglify())
      .pipe(gulp.dest('./assets/'));
  });

gulp.task('jekyll', shell.task(['bundle exec jekyll build --config "_config.yml,_config.dev.yml"']));

gulp.task('jekyll-rebuild', ['jekyll'], function () {
    browserSync.reload();
});


gulp.task('serve', function () {
    browserSync.init({
        logConnections: true,
        server: {
            baseDir: '_site/'
        }
    });
    // Reloads page when some of the already built files changed:
    gulp.watch('_site/**/*.*').on('change', browserSync.reload);
    gulp.watch('./_assets/js/*.js', ['scripts']);
    gulp.watch([
        '_config.yml',
        '_config.dev.yml',
        './**/*.html',
        '!./_site/','./**/*.md', 
        './_assets/scss/**/*.*',
        './assets/script.js'
    ],
    ['jekyll-rebuild']);
});

gulp.task('default', 
    [
        'clean-scripts', 
        'scripts',
        'jekyll', 
        'serve'
    ]
);
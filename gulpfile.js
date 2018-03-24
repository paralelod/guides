const gulp = require('gulp');
const shell = require('gulp-shell');
const browserSync = require('browser-sync').create();

var gulpCloudinary = require('gulp-cloudinary');
var config = { 
	cloud_name: 'diogorusso', 
	api_key: '539963394324974', 
	api_secret: 'LbSkIqejQ8ApC_lABEFCEvQz1-U'
};

var defaultTags = ['projectX1'];

var builderDefault = new gulpCloudinary(config, defaultTags);

gulp.task('clean', function(){
	builderDefault.deleteOldByTag();
});

gulp.task('upload_images', function() {
  	return gulp.src(['.assets/img/**/**/*.jpg'])
  		.pipe(builderDefault.uploader())
  		.pipe(gulp.dest('/bio'))
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
        'jekyll', 
        'serve'
    ]
);
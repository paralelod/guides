var gulp = require('gulp');
var hologram = require('gulp-hologram');

gulp.task('hologram', function() {
        gulp.src('./hologram_config.yml')
        .pipe(hologram({logging:true}));
});
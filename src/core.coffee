gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
path = require 'path'
jade = require 'gulp-jade'
sass = require 'gulp-sass'

module.exports =
class Core
  @build: (src, dist) ->
    gulp
      .src(path.join(src, '/**/*.coffee'))
      .pipe(coffee(bare: true)
      .on('error', gutil.log))
      .pipe gulp.dest(path.join(dist))

    gulp
      .src(path.join(src, '/**/*.jade'))
      .pipe(jade()
      .on('error', gutil.log))
      .pipe gulp.dest(path.join(dist))

    gulp
      .src(path.join(src, '/**/*.scss'))
      .pipe(sass()
      .on('error', gutil.log))
      .pipe gulp.dest(path.join(dist))

    gulp
      .src([
        path.join(src, '/**/*'),
        "!#{path.join(src, '/**/*.coffee')}",
        "!#{path.join(src, '/**/*.jade')}",
        "!#{path.join(src, '/**/*.scss')}",
      ])
      .pipe gulp.dest(path.join(dist))

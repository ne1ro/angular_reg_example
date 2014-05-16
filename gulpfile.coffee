# Include gulp files
gulp = require 'gulp'
gutil = require 'gulp-util'

# Include gulp plugins
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
uglify = require 'gulp-uglify'
sass = require 'gulp-ruby-sass'
gulpif = require 'gulp-if'

# Define static paths
paths =
  scripts: [
    './bower_components/angular/angular.min.js'
    './bower_components/lodash/dist/lodash.min.js'
    './bower_components/restangular/dist/restangular.min.js'
    './bower_components/angular-cookies/angular-cookies.min.js'
    './bower_components/angular-ui-router/release/angular-ui-router.min.js'
    'app/app.coffee'
    'app/classes/*.coffee'
    'app/services/*.coffee'
    'app/controllers/*.coffee'
  ]
  styles: 'app/styles/**/*.sass'
  images: 'app/images/**/*'
  views: 'app/**/*.jade'
  build: 'dist'

gulp.task "fonts", ->
  gulp.src(["./bower_components/font-awesome/fonts/*"])
    .pipe gulp.dest("#{paths.build}/fonts/")

gulp.task 'scripts', ->
  gulp.src(paths.scripts)
    .pipe(gulpif /[.]coffee$/, coffee(bare: yes))
    .pipe(uglify(mangle: false))
    .pipe(concat 'app.js')
    .pipe gulp.dest("#{paths.build}/js/")

gulp.task 'views', ->
  gulp.src(paths.views).pipe(jade({})).pipe gulp.dest(paths.build)
  gulp.src(paths.images).pipe gulp.dest("#{paths.build}/images/")

gulp.task 'styles', ->
  gulp.src(paths.styles).pipe(sass())
    .pipe(concat 'app.css')
    .pipe gulp.dest("#{paths.build}/css/")

gulp.task 'connect', ->
  connect.server(
    root: ['dist']
    port: 3000
    livereload: true
  )

gulp.task 'livereload', ->
  gulp.src("#{paths.build}/**/*").pipe connect.reload()

gulp.task 'watch', ->
  gulp.watch "#{paths.build}/**/*", ['livereload']
  gulp.watch 'app/**/*.coffee', ['scripts']
  gulp.watch 'app/**/*.sass', ['styles']
  gulp.watch 'app/**/*.jade', ['views']
  gulp.watch 'app/images/**/*', ['views']

gulp.task 'build', ['views', 'styles', 'scripts', 'fonts']

gulp.task 'default', ['build', 'connect', 'watch']

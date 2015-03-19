source = require 'vinyl-source-stream'
gulp = require 'gulp'
gutil = require 'gulp-util'
browserify = require 'browserify'
coffee_reactify = require 'coffee-reactify'
watchify = require 'watchify'
notify = require 'gulp-notify'

paths =
    srcFiles: ['./src/app.coffee']
    build: './src/'
    buildFile: 'bundle.js'

buildScript = (files, watch) ->
    rebundle = ->
        stream = bundler.bundle()
        stream.on("error", notify.onError(
            title: "Compile Error"
            message: "<%= error.message %>"
        )).pipe(source(paths.buildFile)).pipe gulp.dest(paths.build)

    props = watchify.args
    props.entries = files
    props.debug = true

    bundler = (if watch then watchify(browserify(props)) else browserify(props))
    bundler.transform coffee_reactify
    bundler.on "update", ->
        rebundle()
        gutil.log "Rebundled..."
        return

    rebundle()


gulp.task "default", ->
    buildScript paths.srcFiles, false

gulp.task "watch", ["default"], ->
    buildScript paths.srcFiles, true

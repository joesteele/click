class Logger
  @metrics: {}

  @log: ->
    return unless app.config.debug

    console.log arguments...

  @startProfiling: (metric) ->
    return unless app.config.debug

    @metrics[metric] ?= {}
    @metrics[metric].start = new Date().valueOf()

  @endProfiling: (metric) ->
    return unless app.config.debug

    if tracked = @metrics[metric]
      tracked.end = new Date().valueOf()
      tracked.elapsed = tracked.end - tracked.start
      @metrics[metric] = tracked
      @log "start: #{tracked.start}, end: #{tracked.end}, elapsed: #{tracked.elapsed}"

module.exports = Logger


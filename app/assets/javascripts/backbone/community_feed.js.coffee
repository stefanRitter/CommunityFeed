#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers


window.CommunityFeed =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  start: ->
    Backbone.history.start pushState: true
    @stories.fetch
      reset: true

      success: =>
        # @router.navigate '/community_feed', trigger: true

      error: (err) ->
        console.log 'error loading stories:'
        console.log err


# document ready
$ ->
  CommunityFeed.start()

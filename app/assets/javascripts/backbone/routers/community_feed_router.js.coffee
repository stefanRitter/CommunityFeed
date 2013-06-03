#
# defines the main router

class CommunityFeed.Routers.CommunityFeedRouter extends Backbone.Router
  initialize: (options) ->
    return

  routes:
    ".*"        : "feed"

  feed: ->
    @header = new CommunityFeed.Views.Header()
    @stories = new CommunityFeed.Views.Stories( collection: CommunityFeed.stories )

    $body = $('body')
    $body.append @header.render().el
    $body.append @stories.el


CommunityFeed.router = new CommunityFeed.Routers.CommunityFeedRouter

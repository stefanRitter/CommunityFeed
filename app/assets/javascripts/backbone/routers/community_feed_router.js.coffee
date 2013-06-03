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
    @user_profile = new CommunityFeed.Views.User( model: CommunityFeed.user )
    @newStory_form = new CommunityFeed.Views.NewStory( model: CommunityFeed.user )

    $body = $('body')
    $body.append @header.render().el
    $body.append @stories.el
    $body.append @user_profile.el
    $body.append @newStory_form.el


CommunityFeed.router = new CommunityFeed.Routers.CommunityFeedRouter

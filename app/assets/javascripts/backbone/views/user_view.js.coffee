#
# defines user profile view


class CommunityFeed.Views.User extends Backbone.View
  className: 'userProfile hidden'
  template: JST["backbone/templates/user_template"]

  initialize: ->
    @model.bind 'change', @render

  render: =>
    if @model.get('loggedIn')
      @$el.removeClass 'hidden'
      @$el.html @template( @model.toJSON() )
      setTimeout =>
          @$el.addClass 'slide'
        , 700
    else
      @$el.addClass 'hidden'
      setTimeout =>
          @$el.removeClass 'slide'
        , 500

    return this

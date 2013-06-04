#
# defines new story view


class CommunityFeed.Views.NewStory extends Backbone.View
  className: 'newStory hidden'
  template: JST["backbone/templates/newStory_template"]

  initialize: ->
    @model.bind 'change', @render

  render: =>
    if @model.get('loggedIn')
      @$el.removeClass 'hidden'
      @$el.html @template( @model.toJSON() )
      setTimeout =>
          @$el.addClass 'slide'
        , 1000
    else
      @$el.addClass 'hidden'
      setTimeout =>
          @$el.removeClass 'slide'
        , 500

    return this

#
# defines story view


class CommunityFeed.Views.Story extends Backbone.View
  className: 'story'
  template: JST["backbone/templates/story_template"]

  initialize: () ->
    @$el.addClass @model.get('size')

  render: =>
    @$el.html @template( @model.toJSON() )
    return this


class CommunityFeed.Views.Stories extends Backbone.View
  className: 'feed'

  initialize: ->
    @collection.bind 'add', @renderOne
    @collection.bind 'reset', () =>
      @render()

  renderOne: (story) ->
    tempView = new CommunityFeed.Views.Story( model: story )
    @$el.append tempView.render().el

  render: ->
    @collection.forEach(@renderOne, @)
    return this

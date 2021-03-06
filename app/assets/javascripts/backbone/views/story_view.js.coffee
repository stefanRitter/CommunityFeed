#
# defines story and stories view


class CommunityFeed.Views.Story extends Backbone.View
  className: 'story fadeInUp'
  template: JST["backbone/templates/story_template"]

  initialize: () ->
    @$el.addClass @model.get('size')
    @$el.addClass 'priority' + @model.get('priority')

  render: =>
    @$el.html @template( @model.toJSON() )
    @el.style.height = @get_height() + 'px'
    return this

  get_height: ->
    maxWidth = window.innerWidth - window.innerWidth/10
    percentage = 23.3
    return maxWidth/100 * percentage


class CommunityFeed.Views.Stories extends Backbone.View
  className: 'feed'
  loggedIn: false
  count: 0

  initialize: ->
    # render on session change @model = user
    @model.bind 'change', () =>
      @render()

    @collection.bind 'add', @renderOne
    @collection.bind 'reset', () =>
      @render()

    $(window).on 'resize', () =>
      @render()

  renderOne: (story) ->
    if story.get('public') or @loggedIn
      tempView = new CommunityFeed.Views.Story( model: story )
      tempView.render()

      @count += 1
      @count += 1 if story.get('size') is 'big'
      if @count % @num_columns() == 0 and @count != 0
        $(tempView.el).addClass('break')

      @$el.append tempView.el

  render: ->
    @loggedIn = @model.get('loggedIn')
    @$el.fadeOut 'slow', =>
      @$el.empty()
      @count = 0
      @collection.forEach(@renderOne, @)
      @$el.fadeIn('slow')
    return this

  num_columns: ->
    return 4

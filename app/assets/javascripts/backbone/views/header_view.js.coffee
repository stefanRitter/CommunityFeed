#
# defines the header view


class CommunityFeed.Views.Header extends Backbone.View
  tagName: 'header'
  className: 'mainHeader'
  template: JST["backbone/templates/header_logOut_template"]

  initialize: (options) ->
    return

  events:
    'click .signIn-btn': 'login'
    'click .logout': 'logout'
    'click .home-btn': ->
      alert "this will take you back to the homepage"
    'click': (e)->
      e.preventDefault()
      e.stopPropagation()

  render: ->
    @$el.html @template()
    return this

  login: (e)->
    e.preventDefault()
    e.stopPropagation()

    @$el.slideUp 'fast', =>
      @template = JST["backbone/templates/header_logIn_template"]
      @render()
      @$el.slideDown ->
        $('.mainHeader_spacer').addClass 'shrink_to_login_size'
        CommunityFeed.user.set 'loggedIn', true

  logout: (e)->
    e.preventDefault()
    e.stopPropagation()

    $('.mainHeader_spacer').removeClass 'shrink_to_login_size'
    @$el.slideUp 'fast', =>
      @template = JST["backbone/templates/header_logOut_template"]
      @render()
      @$el.slideDown 'slow', ->
        CommunityFeed.user.set 'loggedIn', false

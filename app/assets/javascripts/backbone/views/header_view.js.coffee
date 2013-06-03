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

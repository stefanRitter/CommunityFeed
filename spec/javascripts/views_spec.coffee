#
# Jasmine coffescript test specs
#

require '/assets/application.js'


# VIEWS

#NewStory
describe 'CommunityFeed.Views.NewStory', ->
  user = null
  view = null

  beforeEach ->
    user = new CommunityFeed.Models.User
    view = new CommunityFeed.Views.NewStory( model: user )

  it 'renders a div.newStory.hidden', ->
    expect( view.render().$el.attr('class') ).toBe('newStory hidden')

  it 'is visible when logged in', ->
    user.set('loggedIn', true)
    expect( view.render().$el.attr('class') ).toBe('newStory')


#UserProfile
describe 'CommunityFeed.Views.User', ->
  user = null
  view = null

  beforeEach ->
    user = new CommunityFeed.Models.User
    view = new CommunityFeed.Views.User( model: user )

  it 'renders a div.userProfile.hidden', ->
    expect( view.render().$el.attr('class') ).toBe('userProfile hidden')

  it 'is visible when logged in', ->
    user.set('loggedIn', true)
    expect( view.render().$el.attr('class') ).toBe('userProfile')

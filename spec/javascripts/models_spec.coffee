#
# Jasmine coffescript test specs
#

require '/assets/application.js'
require '/assets/sinon.js'


# MODELS & COLLECTIONS

# User
describe 'Model: CommunityFeed.Models.User', ->
  user = null

  beforeEach ->
    user = new CommunityFeed.Models.User

  it 'is defined', ->
    expect( CommunityFeed.Models.User ).not.toBeUndefined()

  it 'looks like a Backbone.js model', ->
    expect( _.isFunction(user.get) ).toBe(true)
    expect( _.isFunction(user.set) ).toBe(true)

  it 'has a loggedIn field', ->
    expect( user.get('loggedIn') ).toBeDefined()


# Story
describe 'Model: CommunityFeed.Models.Story', ->
  it 'is defined', ->
    expect( CommunityFeed.Models.Story ).not.toBeUndefined()

  it 'fires a change event when a title is edited', ->
    eventSpy = sinon.spy()
    story = new CommunityFeed.Models.Story({ title: 'firstTitle'})
    story.on('change', eventSpy)
    story.set('title', 'secondTitle')
    expect( eventSpy.called ).toBe(true)


# Stories
describe 'Collection: CommunityFeed.Collections.Stories', ->
  stories = null

  beforeEach ->
    stories = new CommunityFeed.Collections.Stories

  it 'is defined', ->
    expect( CommunityFeed.Collections.Stories ).not.toBeUndefined()

  it 'has a collection of stories', ->
    expect( stories.models ).not.toBeUndefined()
    expect( stories.model ).toBe( CommunityFeed.Models.Story )

  it 'can add and get a model by id', ->
    stories.reset([ { id: 5000 }, { id: 2000 } ])
    newStory = stories.get(5000)
    expect( newStory.get('id') ).toBe(5000)


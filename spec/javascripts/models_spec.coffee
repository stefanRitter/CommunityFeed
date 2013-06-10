#
# Jasmine coffescript test specs
#

require '/assets/application.js'


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


#
# defines the Story model and the Feed collection


class CommunityFeed.Models.Story extends Backbone.Model


class CommunityFeed.Collections.Stories extends Backbone.Collection
  url: '/sampleStories.json'
  model: CommunityFeed.Models.Story


CommunityFeed.stories = new CommunityFeed.Collections.Stories

#
# defines the user model


class CommunityFeed.Models.User extends Backbone.Model
  defaults:
    loggedIn: false

CommunityFeed.user = new CommunityFeed.Models.User

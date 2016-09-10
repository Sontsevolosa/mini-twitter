class PagesController < ApplicationController
  def home
    if logged_in?
      @tweet = current_user.tweets.build
      @feed_items = current_user.feed.build if logged_in?
  end
end

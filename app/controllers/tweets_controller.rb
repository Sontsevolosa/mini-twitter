class TweetsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_url
    else
      render 'pages/index'
    end
  end

  def destroy
  end
end

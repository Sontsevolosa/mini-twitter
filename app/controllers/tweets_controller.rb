class TweetsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/index'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to request.referrer || root_url
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content)
    end

    def correct_user
      @tweet = current_user.tweets.find_by(id: params[:id])
      redirect_to root_url if @tweet.nil?
    end
end

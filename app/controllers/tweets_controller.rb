class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweets_param)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.create(tweets_param)
    if @tweet.save
      redirect_to tweets_path, notice: "つぶやきました♪"
    else
      render 'new'
    end
  end

  def edit
    # @tweet = Tweet.find(params[:id])
  end

  def update
    # @tweet = Tweet.find(params[:id])
    if @tweet.update(tweets_param)
      redirect_to tweets_path, notice: "編集しました！"
    else
      render 'new'
    end
  end

  def destroy
    # @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました..."
  end

  def confirm
    @tweet = Tweet.new(tweets_param)
    render :new if @tweet.invalid?
  end

  private
    def tweets_param
      params.require(:tweet).permit(:content)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end

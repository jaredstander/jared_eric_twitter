get '/' do
  erb :index
end

get '/:username/timeline' do
  user = params[:username]

  tweets = Twitter.user_timeline(user)

  @tweet_text = []
  tweets.each do |tweet|
    @tweet_text << tweet[:text] #tweet[:text]
  end

  p @tweet_text
  erb :user_timeline
end

get '/:username' do
  
  @user = Twitteruser.find_by_username(params[:username])
  Twitteruser.create(username: params[:username]) if !@user
  
  if @user.tweets.empty?
    @user_tweets= @user.fetch_tweets! 
  end

  @user_tweets = @user.tweets.limit(10)

  erb :user_cached_timeline
end

get '/tweets/new' do
  erb :new_tweet
end

post '/tweets' do
  Twitter.update(params[:tweet_text])
  erb :tweeted
end

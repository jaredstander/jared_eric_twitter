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

get '/jt'

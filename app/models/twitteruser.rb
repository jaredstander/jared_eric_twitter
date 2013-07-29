class Twitteruser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    if self.tweets.empty?
      tweets = Twitter.user_timeline(self.username)
      
      tweets.each do |tweet|
        self.tweets << Tweet.create(text: tweet[:text])
      end

       self.tweets
    end

  end
end

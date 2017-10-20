require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'YqXMkjWa8Y8M3WJTDlbTgEwNv'
  config.consumer_secret = '3dpBLfMsJRH7G8OkujV6mTbNZJsfLgQoZaiJxYEU1063I91Hd9'
  config.access_token = '2450476376-Ybc18nuP20aWF3U94iKhs6jWxzpdZmiGFT2BZC2'
  config.access_token_secret = 'YRHkrTo7p5Xw7xUHno4VQU6oWlF7WD5iqFiv4omkDQHxW'
end

search_term = URI::encode('#docker')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mError Bung!.\e[0m"
  end
end

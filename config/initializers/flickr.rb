FlickRaw.api_key=ENV["Flickr_key"]
FlickRaw.shared_secret=ENV["Flickr_secret"]

# require 'rest-client'

# search_term = 'snail'

# response = RestClient.get 'http://www.reddit.com/search.json',{:params =>}

# if(response.code==200)
#   response_object = JSON.parse(response)
#   reddit_posts = response_object['data']['children']

#   reddit_posts.each do |post|
#   puts post.title
# end

# else
#   puts "an error happened"
#   puts response
#   puts response code
# end

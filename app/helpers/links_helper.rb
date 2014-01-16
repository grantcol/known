module LinksHelper
	def link_params
    	params.require(:link).permit(:title, :url, :tag_list, :channel_ids)
  	end

  	def generate_tags
  		#find hashtags from the string. if there are none, generate tags programmatically
  		#gem summarize
  		hashtag_array = tweet.split.find_all{|word| /^#.+/.match word}
  		return hashtag_array
  	end

  	def add_to_channel (channel)
  		#add it to the channel of choice if applicable
  	end
end

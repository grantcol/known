module LinksHelper
	def post_params
    	params.require(:link).permit(:title, :url, :tag_list)
  	end
end

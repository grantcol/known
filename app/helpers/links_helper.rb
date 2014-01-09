module LinksHelper
	def link_params
    	params.require(:link).permit(:title, :url, :tag_list)
  	end
end

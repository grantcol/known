module PostsHelper
	 def post_params
    	params.require(:post).permit(:title, :subtitle, :body)
  	end
end

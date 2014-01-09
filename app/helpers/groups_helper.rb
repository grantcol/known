module GroupsHelper
	def group_params
		params.require(:group).permit(:name, :desc)
end

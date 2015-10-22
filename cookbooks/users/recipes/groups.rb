search("groups", "*:*").each do | group_data |
	group group_data["id"] do
	  action :create
	  gid group_data["gid"]
	  members group_data["members"]
	end
end


module UsersHelper
    def create_initials(user)
        initials = ""
        user.name.split(" ").map {|n| initials <<  n[0]}
        initials
    end
end

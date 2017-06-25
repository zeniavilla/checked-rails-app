module ApplicationHelper
    def user_signed_in?
        !!session[:user_id]
    end


    def num_chores(model_object)
        model_object.chores.where(active: true).count
    end
end

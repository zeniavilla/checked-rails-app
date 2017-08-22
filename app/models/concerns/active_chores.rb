module ActiveChores
    extend ActiveSupport::Concern
    
    included do
        belongs_to :user, required: false
    end
    
    def my_active_chores
        if self.chores.empty?
            return nil
        else
            self.chores.where("active IS true")
        end
    end
end
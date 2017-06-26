module ActiveChores
    extend ActiveSupport::Concern
    
    included do
        belongs_to :user
    end
    
    def my_active_chores
        @active_chores ||= self.chores.where("active IS ?", true)
    end
end
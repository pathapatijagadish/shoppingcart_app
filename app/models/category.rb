class Category < ActiveRecord::Base
   attr_accessible :name, :user_id
   has_many :products,:dependent=>:destroy
   belongs_to :user
end

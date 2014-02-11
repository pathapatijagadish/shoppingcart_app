class Photo < ActiveRecord::Base
  attr_accessible :image,:product_id
  belongs_to :product
  has_attached_file :image,:styles => {:thumb=> "100x100#",:small  => "300x300>",:large => "600x600>"}
end

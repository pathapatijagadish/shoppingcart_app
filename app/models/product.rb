class Product < ActiveRecord::Base
  attr_accessible :category_id, :color, :discount, :name, :price, :size, :user_id
  # belongs_to :imageable,:polymorphic=>true
  belongs_to :category
  belongs_to :user
  has_many :photos,:dependent => :destroy
  accepts_nested_attributes_for :photos,:allow_destroy => true
  validates_presence_of :name
 end

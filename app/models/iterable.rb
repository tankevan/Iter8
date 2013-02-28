class Iterable < ActiveRecord::Base
  attr_accessible :name, :position, :is_header
  has_and_belongs_to_many :users
  has_many :posts

end

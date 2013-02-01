class Post < ActiveRecord::Base
  attr_accessible :post
  has_many :comments
  belongs_to :iterable

end

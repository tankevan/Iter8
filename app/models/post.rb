class Post < ActiveRecord::Base
  attr_accessible :post
  has_many :comments
  has_many :actions
  belongs_to :iterable
  belongs_to :user

end

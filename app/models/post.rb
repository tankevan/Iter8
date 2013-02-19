class Post < ActiveRecord::Base
  attr_accessible :post, :user_id
  has_many :comments
  has_many :actions
  belongs_to :iterable
  belongs_to :user

end

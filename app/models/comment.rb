class Comment < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :post
  belongs_to :user
  
end

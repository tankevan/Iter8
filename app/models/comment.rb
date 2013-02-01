class Comment < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :post
  
end

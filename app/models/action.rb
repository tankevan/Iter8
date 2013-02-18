class Action < ActiveRecord::Base
  attr_accessible :action, :iterable_id

  belongs_to :post
end

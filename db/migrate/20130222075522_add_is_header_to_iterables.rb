class AddIsHeaderToIterables < ActiveRecord::Migration
  def change
  	add_column :iterables, :is_header, :boolean
  end
end

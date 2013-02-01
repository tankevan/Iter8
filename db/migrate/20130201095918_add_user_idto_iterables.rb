class AddUserIdtoIterables < ActiveRecord::Migration
  def change
  	add_column :iterables, :user_id, :integer
  end
end

class AddPositionToIterables < ActiveRecord::Migration
  def change
    add_column :iterables, :position, :integer
  end
end

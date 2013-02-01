class AddIterableIdtoPost < ActiveRecord::Migration
  def change
  	add_column :posts, :iterable_id, :integer
  end
end

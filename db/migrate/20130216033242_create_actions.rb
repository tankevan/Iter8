class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.text :action
      t.integer :post_id

      t.timestamps
    end
  end
end

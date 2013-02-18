class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :action
      t.integer :post_id

      t.timestamps
    end
  end
end

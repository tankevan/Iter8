class CreateIterables < ActiveRecord::Migration
  def change
    create_table :iterables do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateIterablesUsers < ActiveRecord::Migration
  def change
    create_table :iterables_users, :id => false do |t|
      t.integer :user_id
      t.integer :iterable_id
    end
  end
end

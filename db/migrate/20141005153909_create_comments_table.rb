class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user_profile
      t.references :event
      t.timestamps
    end
  end
end

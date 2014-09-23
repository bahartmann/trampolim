class CreateEventsAndUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.text :about
      t.references :user
    end

    create_table :events do |t|
      t.string :title, null: false, default: ""
      t.text :about
      t.string :category
      t.datetime :datetime
      t.decimal :price
      t.references :user_profile
    end
  end
end

class CreateRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :user_profile
      t.references :event
    end
  end
end

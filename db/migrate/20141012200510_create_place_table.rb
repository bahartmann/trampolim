class CreatePlaceTable < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :formatted_address
      t.decimal :lat
      t.decimal :lon
      t.references :event
    end
  end
end

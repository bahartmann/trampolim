class AssociateEventsAndGuests < ActiveRecord::Migration
  def change
    create_table :events_guests, id: false do |t|
      t.belongs_to :event
      t.belongs_to :user_profile
    end
  end
end

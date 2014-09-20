class AddUserProfileRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user_profile, index: true
  end
end

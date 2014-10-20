class AddUserFollowers < ActiveRecord::Migration
  def change
    create_table :followers, id: false do |t|
      t.belongs_to :user_profile, class_name: 'UserProfile'
      t.belongs_to :follower, class_name: 'UserProfile'
    end
  end
end

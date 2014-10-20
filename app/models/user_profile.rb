# -*- encoding: utf-8 -*-
class UserProfile < ActiveRecord::Base

  has_many :events
  belongs_to :user
  has_and_belongs_to_many :confirmed_events, class_name: 'Event', join_table: :events_guests
  has_and_belongs_to_many :followers,
              class_name: 'UserProfile',
              join_table: :followers,
              foreign_key: :user_profile_id,
              association_foreign_key: :follower_id

  has_and_belongs_to_many :following,
              class_name: 'UserProfile',
              join_table: :followers,
              foreign_key: :follower_id,
              association_foreign_key: :user_profile_id

  def gravatar_path(size=21)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.user.email)}?d=identicon&s=#{size}"
  end

end

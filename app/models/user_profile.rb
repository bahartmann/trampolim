# -*- encoding: utf-8 -*-
class UserProfile < ActiveRecord::Base

  has_many :events
  belongs_to :user

  def gravatar_path(size=21)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.user.email)}?d=identicon&s=#{size}"
  end

end

# -*- encoding: utf-8 -*-
class UserProfile < ActiveRecord::Base

  has_many :events
  belongs_to :user

end

# -*- encoding: utf-8 -*-
class Comment < ActiveRecord::Base

  belongs_to :user_profile
  belongs_to :event
  
  validates_presence_of :text

end

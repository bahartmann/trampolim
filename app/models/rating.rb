# -*- encoding: utf-8 -*-
class Rating < ActiveRecord::Base

  belongs_to :user_profile
  belongs_to :event
  
  validates_inclusion_of :value, in: (0..5)
  validates_uniqueness_of :user_profile, scope: :event

end

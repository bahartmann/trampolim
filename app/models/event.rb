# -*- encoding: utf-8 -*-
class Event < ActiveRecord::Base

  def self.available_categories
    ['concert', 'play', 'exibithion']
  end

  belongs_to :user_profile
  
  validates_presence_of :title
  validates_inclusion_of :category, in: Event.available_categories

  mount_uploader :poster, PosterUploader

end

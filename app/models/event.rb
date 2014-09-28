# -*- encoding: utf-8 -*-
class Event < ActiveRecord::Base

  def self.available_categories
    ['concert', 'play', 'exibithion']
  end

  def self.available_prices
    [0, 1, 2, 3]
  end

  belongs_to :user_profile
  
  validates_presence_of :title
  validates_inclusion_of :category, in: Event.available_categories

  mount_uploader :poster, PosterUploader

  scope :category, -> category { where(category: category) }

  def money_range
    MoneyRange.new(price)
  end

end

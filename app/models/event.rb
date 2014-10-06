# -*- encoding: utf-8 -*-
class Event < ActiveRecord::Base

  def self.available_categories
    ['concert', 'play', 'exibithion']
  end

  def self.available_prices
    [0, 1, 2, 3]
  end

  belongs_to :user_profile
  has_and_belongs_to_many :confirmed_guests, class_name: 'UserProfile', join_table: :events_guests
  has_many :comments
  has_many :ratings

  validates_presence_of :title
  validates_inclusion_of :category, in: Event.available_categories

  mount_uploader :poster, PosterUploader

  scope :with_category, -> category { where(category: category) }
  scope :within_price_range_of, -> price { where(price: price) }

  def money_range
    MoneyRange.new(price)
  end

end

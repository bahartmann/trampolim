# -*- encoding: utf-8 -*-
class Place < ActiveRecord::Base
  belongs_to :event
end

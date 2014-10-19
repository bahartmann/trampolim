# -*- encoding: utf-8 -*-
class Place < ActiveRecord::Base
  belongs_to :event

  def image_map_url
    params = {
      markers: self.lat.to_s + ',' + self.lon.to_s,
      zoom: 15,
      size: '600x300',
      maptype: 'roadmap'
    }
    url = "http://maps.googleapis.com/maps/api/staticmap?#{params.to_query}"
  end

  def map_url
    params = {
      q: self.lat.to_s + ',' + self.lon.to_s,
      ll: self.lat.to_s + ',' + self.lon.to_s,
      z: 13
    }
    url = "http://maps.google.com/maps?#{params.to_query}"
  end
end

class Visit < ApplicationRecord

  def self.record_visit!(user, shortened_url)
    Visit.create!(user.id, shortened_url.id)
  end













end

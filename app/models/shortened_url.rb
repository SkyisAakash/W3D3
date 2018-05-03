# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  short_url  :string
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

class ShortenedUrl < ApplicationRecord

  validates :long_url, presence:true, uniqueness:true

  def self.random_code
    code = SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64(16)
    end
    code
  end

  def self.shortener(user, longer)
    code = ShortenedUrl.random_code
    ShortenedUrl.create!(short_url: code, long_url: longer, user_id: user.id)
  end


end

# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :text             not null
#  short_url  :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true
  validates :long_url, :short_url, uniqueness: true

  def self.converter(user,long_url)
    if ShortenedUrl.exists?(long_url: long_url)
      return ShortenedUrl.find_by(long_url: long_url)
    end

    short_url = SecureRandom.urlsafe_base64(8)
    until !ShortenedUrl.exists?(short_url: short_url)
      short_url = SecureRandom.urlsafe_base64(8)
    end

     ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user.id)

  end



  belongs_to :submitter, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  }
end

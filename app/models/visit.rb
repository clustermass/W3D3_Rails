# == Schema Information
#
# Table name: visits
#
#  id           :bigint(8)        not null, primary key
#  user_id      :integer          not null
#  short_url_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Visit < ApplicationRecord

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, short_url_id: shortened_url.id)
  end

  belongs_to :shortened_url, {
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl
  }
end

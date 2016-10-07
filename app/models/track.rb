# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  bonus      :boolean          default(FALSE), not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, presence: true

  belongs_to :album

  has_one :band,
  through: :album,
  source: :band
end

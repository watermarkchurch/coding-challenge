class Message < ApplicationRecord
  validates :title, presence: true

  has_one_attached :media
  has_one_attached :thumbnail

  validate :validate_media_format

  private

  def validate_media_format
    return unless media.attached?

    if !media.content_type.in?(%w[video/mp4 audio/mpeg audio/mp3])
      errors.add(:media, 'must be an MP4 video or MP3 audio file')
    end
  end
end

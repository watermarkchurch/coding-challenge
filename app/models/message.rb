class Message < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :video
    default_scope -> { order(created_at: :desc) }
    validates :content, presence: true
    validates :title, presence: true
end

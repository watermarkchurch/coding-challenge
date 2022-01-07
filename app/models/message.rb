class Message < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :video
    validates :content, presence: true
    validates :title, presence: true
end

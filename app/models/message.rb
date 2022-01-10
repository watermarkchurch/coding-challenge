class Message < ApplicationRecord
    has_many :taggings
    has_many :tags, through: :taggings
    has_one_attached :thumbnail
    has_one_attached :video
    default_scope -> { order(created_at: :desc) }
    validates :content, presence: true
    validates :title, presence: true
    # validates :thumbnail,   content_type: { in: %w[image/jpg image/gif image/png],
    #     message: "must be a valid image format" },
    #     size: { less_than: 5.megabytes,
    #     message:   "should be less than 5MB" }
    validates :video,   content_type: { in: %w[video/mp4],
        message: "must be a valid video format" },
        size: { less_than: 5.megabytes,
        message:   "should be less than 5MB" }

    def tag_list
        self.tags.collect do |tag|
          tag.name
        end.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end

    # Returns a resized image for display.
    def display_image
      thumbnail.variant(resize_to_limit: [500, 500])
    end
end

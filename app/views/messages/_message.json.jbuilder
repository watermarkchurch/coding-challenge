json.extract! message, :id, :title, :content, :tag_list

if message.thumbnail.attached?
    json.thumbnail url_for(message.thumbnail)
end

if message.video.attached?
    json.video url_for(message.video)
end

json.url message_url(message, format: :json)
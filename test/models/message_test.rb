require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.new(title: "Test Message")
  end

  test "should be valid with valid media types" do
    # Test MP4 video
    @message.media.attach(
      io: File.open(Rails.root.join('test/fixtures/files/file_example_MP4_480_1_5MG.mp4')),
      filename: 'test_video.mp4',
      content_type: 'video/mp4'
    )
    assert @message.valid?

    # Test MP3 audio
    @message.media.attach(
      io: File.open(Rails.root.join('test/fixtures/files/file_example_MP3_700KB.mp3')),
      filename: 'test_audio.mp3',
      content_type: 'audio/mpeg'
    )
    assert @message.valid?
  end

  test "should be invalid with wrong media type" do
    @message.media.attach(
      io: File.open(Rails.root.join('test/fixtures/files/test_file.txt')),
      filename: 'test_file.txt',
      content_type: 'text/plain'
    )
    assert_not @message.valid?
    assert_includes @message.errors[:media], 'must be an MP4 video or MP3 audio file'
  end

  test "should accept image as thumbnail" do
    @message.thumbnail.attach(
      io: File.open(Rails.root.join('test/fixtures/files/jesus_flipping_tables.png')),
      filename: 'jesus_flipping_tables.png',
      content_type: 'image/jpeg'
    )
    assert @message.valid?
  end

  # test "the truth" do
  #   assert true
  # end
end

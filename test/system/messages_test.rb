require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "should create message" do
    visit messages_url
    click_on "New message"

    click_on "Create Message"

    assert_text "Message was successfully created"
    click_on "Back"
  end

  test "should update Message" do
    visit message_url(@message)
    click_on "Edit this message", match: :first

    click_on "Update Message"

    assert_text "Message was successfully updated"
    click_on "Back"
  end

  test "should destroy Message" do
    visit message_url(@message)
    click_on "Destroy this message", match: :first

    assert_text "Message was successfully destroyed"
  end

  test "creating a message with attachments" do
    visit messages_url
    click_on "New message"

    fill_in "Title", with: "Message with Attachments"
    fill_in "Description", with: "Test description"

    # Attach media file
    attach_file "Video/Audio File (MP4 or MP3)",
                Rails.root.join('test/fixtures/files/file_example_MP4_480_1_5MG.mp4')

    # Attach thumbnail
    attach_file "Thumbnail Image",
                Rails.root.join('test/fixtures/files/jesus_flipping_tables.png')

    click_on "Create Message"

    assert_text "Message was successfully created"
    assert_selector "video"
    assert_selector "img"
  end

  test "updating a Message with new attachments" do
    visit message_url(@message)
    click_on "Edit this message"

    # Attach new media file
    attach_file "Video/Audio File (MP4 or MP3)",
                Rails.root.join('test/fixtures/files/file_example_MP3_700KB.mp3')

    # Attach new thumbnail
    attach_file "Thumbnail Image",
                Rails.root.join('test/fixtures/files/jesus_flipping_tables.png')

    click_on "Update Message"

    assert_text "Message was successfully updated"
    assert_selector "audio"
    assert_selector "img"
  end
end

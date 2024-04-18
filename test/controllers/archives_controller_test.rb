require "test_helper"

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archives_index_url
    assert_response :success
  end

  test "should get show" do
    get archives_show_url
    assert_response :success
  end

  test "should get new" do
    get archives_new_url
    assert_response :success
  end

  test "should get edit" do
    get archives_edit_url
    assert_response :success
  end
end

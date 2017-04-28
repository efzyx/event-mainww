require 'test_helper'

class ParticipantTeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get participant_teams_index_url
    assert_response :success
  end

  test "should get new" do
    get participant_teams_new_url
    assert_response :success
  end

  test "should get random" do
    get participant_teams_random_url
    assert_response :success
  end

end

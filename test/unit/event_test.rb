# -*- encoding : utf-8 -*-
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "upload csv" do
    Photo.delete_all
    
    event = events(:one)
    event.upload_csv = fixture_file_upload('files/results.csv', 'text/csv')
    event.save
    
    assert_equal 16, Photo.count, "фотографии должны были создаться и без картинок"
    team_one = teams(:one)
    assert_equal 13.3, team_one.result.to_f
    assert_equal 1, team_one.place
    assert_equal 0, team_one.penalty.to_f
  end
end

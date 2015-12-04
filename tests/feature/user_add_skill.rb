require_relative '../test_helper'

class UserCreatesNewSkill < FeatureTest
  def test_new_skill_is_created
    #As a user
    #When I visit the dashboard
    visit '/'
    #And I click the add task button
    click_link("Add Skill")
    #And I am redirected to the new task page
    assert_equal '/skills/new', current_path
    #And I enter the title
    fill_in('skill[name]', with: "Capybara")
    #And I enter the description
    fill_in('skill[status]', with: "animal")
    #And I click submit
    click_button('submit')
    #Then I'm redirected to the tasks page that features my new task
    assert_equal '/skills', current_path
    assert page.has_content?("Capybara")
  end 
end 
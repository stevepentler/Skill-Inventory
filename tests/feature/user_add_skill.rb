require_relative '../test_helper'

class UserCreatesNewSkill < FeatureTest
  def test_new_skill_is_created
    #As a user
    #When I visit the dashboard
    visit '/'
    #And I click the add task button
    click_link("Add Task")
    #And I am redirected to the new task page
    assert_equal '/tasks/new', current_path
    #And I enter the title
    fill_in('task[title]', with: "Capybara")
    #And I enter the description
    fill_in('task[description]', with: "animal")
    #And I click submit
    click_button('submit')
    #Then I'm redirected to the tasks page that features my new task
    assert_equal '/tasks', current_path
    assert page.has_content?("Capybara")
  end 
end 
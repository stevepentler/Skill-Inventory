require_relative '../test_helper'

class UserEditsSkill < FeatureTest
    
  def test_skill_is_edited
    SkillInventory.create({name: "Numchuck!",
                        status: "Swing"})
    #When I visit the task index
    visit '/skills'
    #And I see the tasks
    #And I click the edit link
    click_link("edit")
    #And I get redirected to the edit screen
    #And I enter title
    fill_in('skill[name]', :with => "modified name")
    #And I enter description
    fill_in('skill[status]', :with => "modified status")
    #And I click submit 
    click_button("submit")
    #I am redirected to task id
    #Then the title and description have been modified
    assert page.has_content?("modified name")
    assert page.has_content?("modified status")
  end
end 
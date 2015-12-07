  require_relative "../test_helper"

  class UserDeletesSkill < FeatureTest
      
    def test_skill_is_deleted
      SkillInventory.create({name: "Numchuck!",
                          status: "Swing"})
      #When I visit the task index
      visit '/skills'

      #And I locate the task I want to delete
      assert page.has_content?("Numchuck!")
      
      #And I click the delete button
      find("#delete_button_1").click_button("delete")
      
      refute page.has_content?("Numchuck")
      assert '/skills', current_path
    end 

  end 
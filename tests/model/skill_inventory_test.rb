require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test 
 
  def create_skills(num)
    num.times do |n|
      SkillInventory.create({name: "skill-name #{n+1}", 
                             status: "skill-status #{n+1}" })
    end 
  end

  def test_creates_skill
    create_skills(1)
    skill = SkillInventory.all.last 
    assert_equal SkillInventory.all.last.id, skill.id
  end 

  def test_finds_task_by_id
    create_skills(2)
    id1 = SkillInventory.all.first.id
    assert_equal "skill-name 1", 

    id = SkillInventory.all.last.id
    skill1 = SkillInventory.find(id)
  end 

  # def test_update_existing_task
  #   create_skills(3)
  #   skill2 = SkillInventory.find(2)
  #   assert_equal "skill-name 2", skill2.name
  #   assert_equal "skill-status 2", skill2.status
  #   assert_equal 2, skill2.id
  # end 

  # def test_delete_existing_task
  #   create_skills(5)
  #   skill2 = SkillInventory.find(2)
  #   assert_equal "skill-name 2", skill2.name
  #   assert_equal 5, SkillInventory.all.count
    
  #   SkillInventory.delete(2)
  #   assert_equal 4, SkillInventory.all.count
    
  #   skill_last = SkillInventory.all.last
  #   assert_equal 5, skill_last.id
  # end 
end

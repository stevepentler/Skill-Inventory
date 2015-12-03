require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test 
 
  def create_skills(num)
    num.times do |n|
      SkillInventory.create({name: "skill-name #{n+1}", 
                             status: "skill-status #{n+1}" })
    end 
  end

  def test_creates_total_tasks_using_create_skills
    create_skills(5)
    assert_equal 5, SkillInventory.all.count
  end 

  def test_skill_can_be_created
    create_skills(5)
    skill1 = SkillInventory.find(1)
    assert_equal "skill-name 1", skill1.name
    assert_equal "skill-status 1", skill1.status
    assert_equal 1, skill1.id
    skill3 = SkillInventory.find(3)
    assert_equal "skill-name 3", skill3.name
    assert_equal "skill-status 3", skill3.status
    assert_equal 3, skill3.id
  end 

  def test_finds_task_in_list
    create_skills(5)
    skill1 = SkillInventory.find(1)
    assert_equal "skill-name 1", skill1.name
    assert_equal "skill-status 1", skill1.status
    assert_equal 1, skill1.id
    skill2 = SkillInventory.find(2)
    assert_equal "skill-name 2", skill2.name
    assert_equal "skill-status 2", skill2.status
    assert_equal 2, skill2.id
    skill3 = SkillInventory.find(3)
    assert_equal "skill-name 3", skill3.name
    assert_equal "skill-status 3", skill3.status
    assert_equal 3, skill3.id
  end 

  def test_update_existing_task
    create_skills(3)
    skill2 = SkillInventory.find(2)
    assert_equal "skill-name 2", skill2.name
    assert_equal "skill-status 2", skill2.status
    assert_equal 2, skill2.id
  end 

  def test_delete_existing_task
    create_skills(5)
    skill2 = SkillInventory.find(2)
    assert_equal "skill-name 2", skill2.name
    assert_equal 5, SkillInventory.all.count
    
    SkillInventory.delete(2)
    assert_equal 4, SkillInventory.all.count
    
    skill_last = SkillInventory.all.last
    assert_equal 5, skill_last.id

  end 
end

require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test 

  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ :name       => "name #{i+1}",
                           :status => "status #{i+1}"})
    end
  end

  def test_creates_skill
    create_skills(1)
    skill = SkillInventory.all.last
    assert_equal "name 1", skill.name
  end 

  def test_finds_task_by_id
    create_skills(2)
    skill = SkillInventory.all.last.id
    assert_equal "name 2", SkillInventory.find(skill).name
    assert_equal "status 2", SkillInventory.find(skill).status
  end 

  def test_update_existing_task
    create_skills(1)
    id = SkillInventory.all.last.id 

    SkillInventory.update(id, {name: "modified name", status: "modified status"})

    skill = SkillInventory.find(id)
    assert_equal "modified name", skill.name
    assert_equal "modified status", skill.status

  end 

  def test_delete_existing_task
    create_skills(2)
    total = SkillInventory.all.count 

    skill = SkillInventory.all.last 
    assert_equal "name 2", skill.name

    SkillInventory.delete(skill.id)

    assert_equal (total - 1), SkillInventory.all.count 

  end 
end

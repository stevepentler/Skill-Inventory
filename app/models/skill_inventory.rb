require 'yaml/store'
require 'pry'

class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == "test"           
      @database ||= Sequel.sqlite("db/skill_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_manager_development.sqlite3")
    end 
  end

  def self.create(skill)
    database.from(:skills).insert(name: skill[:name], status: skill[:status])
  end

  def self.all
    raw_data = database.from(:skills).to_a
    raw_data.map { |data| Skill.new(data) }
  end

  def self.raw_skills(id)
    raw_skills.find { |skill| skill[:id] == id }
  end 

  def self.find(id)
    data = database.from(:skills).where(id: id).to_a.first
    Skill.new(data)
  end 

  def self.update(id, data)
    database.from(:skills).where(id: id).update(data)
  end 

  def self.delete(id)
    database.from(:skills).where(id: id).delete 
  end 

end

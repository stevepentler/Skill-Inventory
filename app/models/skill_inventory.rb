require 'yaml/store'

class SkillInventory
  def self.create(skill)
    database.transaction do 
      database['skills'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['skills'] << { "id" => database['total'], "name" => skill[:name], "status" => skill[:status] }
    end
  end

  def self.database
    if ENV["RACK_ENV"] == "test"            #local testing
      @database ||= YAML::Store.new("db/task_manager_test")
    else                                    #devlopment (shotgun)
      @database ||= YAML::Store.new("db/task_manager")
    end 
  end

  def self.raw_skills
    database.transaction do 
      database["skills"] || []
    end 
  end 

  def self.all 
    raw_skills.map { |data| Skill.new(data) }
  end 

  def self.raw_task(id)
    raw_skills.find { |skill| skill["id"] == id }
  end 

  def self.find(id)
    Skill.new(raw_task(id))
  end 

  def self.update(id, data)
    database.transaction do 
      target = database["skills"].find { |data| data["id"] == id }
      target["name"] = data[:name]
      target["status"] = data[:status]
    end 
  end 

  def self.delete(id)
    database.transaction do  
      database["skills"].delete_if { |skill| skill["id"] == id }
    end 
  end 

  def self.delete_all
    database.transaction do
      database['skills'] = []
      database['total'] = 0
    end
  end
end

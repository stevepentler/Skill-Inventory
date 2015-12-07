require 'haml'
class SkillInventoryApp < Sinatra::Base

  get '/' do 
    @skills = SkillInventory.all
    haml :index
  end 

  get '/skills' do
    @skills = SkillInventory.all
    haml :index
  end

  get '/skills/new' do
    haml :new
  end 

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :show
  end 

  get '/skills/:id/edit' do |id|  #or params[:id] in block, #id isn't specific to symbol, if multiple go in order
    @skill = SkillInventory.find(id.to_i)
    haml :edit
  end 

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill]) 
    redirect "/skills/#{id}"
  end 

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end 
  
end

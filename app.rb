require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")

get("/") do
  erb(:index)
end

get("/lists/new") do
  erb(:list_form)
end

post("/lists") do
  list_name = params.fetch("list_name")
  list = List.new(:name => list_name, :id => nil)
  list.save()
  erb(:list_confirmation)
end

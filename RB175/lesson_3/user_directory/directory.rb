require 'yaml'
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @users = YAML.load_file('users.yaml')
  @names = @users.keys.map(&:to_s).map(&:capitalize)
end

helpers do
  def parse_hash(name)
    name = name.downcase.to_sym
    email = @users[name][:email]
    interests = @users[name][:interests]
    return email, interests
  end

  def count_interests(hash)
    count = 0
    hash.each do |name, attributes|
      attributes[:interests].each do |interest|
        count += 1
      end
    end
    count
  end
end


get "/" do
  erb :home
end

get "/users/:name" do
  @name = params[:name]
  @email, @interests = parse_hash(@name)
  @other_names = (@names - [@name])
  erb :user
end
# list all users names
# Make sure names are capitalized
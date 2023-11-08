require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'

get "/" do
  # File.read "public/template.html"
  @title = "Book Viewer"
  @contents = File.readlines("data/toc.txt")
  erb :home
end

get "/chapters/:number" do
  @contents = File.readlines("data/toc.txt")

  @title = "Chapter #{params[:number]}: " + @contents[params[:number].to_i - 1]
  @chapter = File.read("data/chp#{params[:number]}.txt")
  erb :chapter
end

get "/show/:name" do
  params[:name]
end
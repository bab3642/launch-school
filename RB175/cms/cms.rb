require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"

# See "Edit" link next to each document
# Clicking this link takes them to an edit page (doc.txt/edit)
# The document content appears within a text area and can be edited
# When click "Save Changes" button, redirected to an index page and shown a message: $FILENAME
# has been updated


root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret'
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".md"
     render_markdown(content)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  end
end

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end
  erb :index
end

get '/:filename' do
  file_path = root + "/data/#{params[:filename]}"
  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

get '/:filename/edit' do
  @filename = params[:filename]
  file_path = root + "/data/#{params[:filename]}"
  if File.exist?(file_path)
    @content = File.read(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
  erb :edit_file
end

post '/:filename' do
  file_path = root + "/data/#{params[:filename]}"
  if File.exist?(file_path)
    File.write(file_path, params[:content])
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
  session[:message] = "#{params[:filename]} has been updated!"
  redirect "/"
end

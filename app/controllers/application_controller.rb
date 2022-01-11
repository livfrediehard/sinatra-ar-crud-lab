
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do 
    @all_articles = Article.all
    erb :index
  end 


  #new
  get '/articles/new' do
    erb :new
end

get '/articles/:id' do 
  @a = Article.find(params[:id])
  erb :show
end 

post '/articles' do 
  article = Article.create(title: params[:title] , content: params[:content])
  redirect to "/articles/#{article.id}"
end 

#update
get '/articles/:id/edit' do 
  @a = Article.find(params[:id])
  erb :edit
end

patch '/articles/:id' do 
  @a = Article.find(params[:id])
  @a.update(title: params[:title] , content: params[:content])
  erb :show
end 

#delete
delete "/articles/:id" do
  Article.destroy(params[:id])
  redirect to "/articles"
end
end
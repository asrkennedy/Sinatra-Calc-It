require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'

get '/hi' do
  "Hello World!"
end

get '/' do
  "this is the homepage"
  end

  get '/name/:first' do
    "hello, #{params[:first]}"
  end

  get '/name/:first/:last/:age' do
    "Your name is #{params[:first]} #{params[:last]}, you are #{params[:age]} years old."
end


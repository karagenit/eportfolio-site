#!/usr/bin/env ruby

require 'sinatra'
require 'csv'

get '/' do
  redirect '/error' unless File.file?('./eportfolio/output.csv')
  erb :index, locals: { data: CSV.parse(IO.read('./eportfolio/output.csv')) }
end

get '/error' do
  'Uh oh...'
end

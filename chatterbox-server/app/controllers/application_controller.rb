class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.all.order(:created_at, :desc).to_json
  end
  
  post '/messages' do
    Message.create(body: params[:body], username: params[:username], created_at: params[:created_at], updated_at: params[:updated_at]).to_json
  end
  
  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(body: params[:body], updated_at: Time.now)
    message.to_json

  end
  
  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    status 204
  end

end

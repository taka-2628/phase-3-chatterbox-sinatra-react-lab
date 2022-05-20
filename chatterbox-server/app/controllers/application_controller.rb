class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET /messages
  get '/messages' do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  # POST /messages
  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  # PATCH /messages/:id
  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  # DELETE /messages/:id
  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end

end
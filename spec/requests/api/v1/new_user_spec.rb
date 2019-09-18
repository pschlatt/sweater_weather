require 'rails_helper'

describe 'user creation' do

  it 'User creation is handle correctly' do


      body = {email: "paul.h.schlattmann@gmail.com",
              password: "123",
              password_confirmation: "123"}


    post '/api/v1/users', params: body

    expect(response.status).to eq 201
    expect(User.first.api_key.class).to eq(String)
    expect(User.count).to eq(1)
  end

  it 'Passwords have to be same value' do
    body = {email: "paul.h.schlattmann@gmail.com",
            password: "123",
            password_confirmation: "1234"}
    post '/api/v1/users', params: body
    expect(response.status).to eq 400
    expect(response.body).to have_content("Password and Password Confirmation need to be identical.")
  end
end

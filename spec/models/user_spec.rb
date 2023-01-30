require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   it "should create a valid user" do
    user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(user).to be_valid
   end

   it "should have a matching password and pasword confirmation" do
    user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'incorrect'
    )
    expect(user.password).to_not be_equal(user.password_confirmation)
   end

   it "should have a password" do
    user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password: nil,
      password_confirmation: 'password'
    )
    expect(user).to_not be_valid
   end

   it "should have a password confirmation" do
    user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: nil
    )
    expect(user).to_not be_valid
   end

   it "should have a last name" do
    user = User.create(
      first_name: 'first_name',
      last_name: nil,
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(user).to be_invalid
   end

   it "should have a first name" do
    user = User.create(
      first_name: nil,
      last_name: 'last_name',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(user).to be_invalid
   end

   it "should have a unique email to be a user" do
    @user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password_digest: 'password'
    )
    @user1 = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.COM',
      password_digest: 'password'
    )
    expect(@user1).to_not be_valid
   end

   it "should have an email to be a valid user" do
    user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: nil,
      password: 'password',
   password_confirmation: 'password'
    )
    expect(user).to_not be_valid
   end

   it "should have a password with a minimum length of 5" do
    user = User.create(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password: 'pass',
   password_confirmation: 'pass'
    )
    expect(user).to_not be_valid
   end

   

  end

  describe '.authenticate_with_credentials' do
    it "should authenticate if email and password are valid" do
      user = User.create(
        first_name: 'first_name',
      last_name: 'last_name',
      email: 'test2@test.com',
      password: 'password',
   password_confirmation: 'password'
      )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq(user)
    end
   
    it "should be a valid email address if space is added" do
      user = User.create(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test2@test.com',
        password: 'password',
     password_confirmation: 'password'
      )
      authenticate = User.authenticate_with_credentials('test2@test.com ', user.password)
      expect(authenticate).to eq(user)
    end

    it "should have a valid email address regardless of case" do
      user = User.create(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test2@test.com',
        password: 'password',
     password_confirmation: 'password'
      )
      authenticate = User.authenticate_with_credentials('TEST2@test.COM', user.password)
      expect(authenticate).to eq(user)
    end
  end

end

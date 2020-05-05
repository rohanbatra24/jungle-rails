require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it "is not valid without password confirmation matching" do
      
      @user = User.new(
      email: "a@a.com",
      password: '111111',
      first_name:'s',
      last_name:'d',
      password_confirmation: '222222')
      @user.save
    
    expect(@user).to_not be_valid
    end

    it "is valid with password confirmation matching" do
      
      @user = User.new(
      email: "a@a.com",
      password: '111111',
      first_name:'s',
      last_name:'d',
      password_confirmation: '111111')
      @user.save
    
    expect(@user).to be_valid
    end

    it "is not valid without password confirmation provided" do
      
      @user = User.new(
      email: "a@a.com",
      first_name:'s',
      last_name:'d',
      password: '1')
    
    expect(@user).to_not be_valid
    end

    it "is valid with password confirmation provided" do
      
      @user = User.new(
      email: "a@a.com",
      first_name:'s',
      last_name:'d',
      password: '111111',password_confirmation: '111111')
    
    expect(@user).to be_valid
    end

    it "is not valid if email already exists" do 

      @user1 = User.create!(
        email: "a",
        first_name:'s',
      last_name:'d',
        password: '111111',
        password_confirmation: '111111')

      @user2 = User.new(
      email: "a",
      first_name:'s',
      last_name:'d',
      password: '111111',
      password_confirmation: '111111')
      @user2.save

    expect(@user2).to_not be_valid

    end

    it "is valid if email does not already exist" do 

      @user2 = User.new(
      email: "a",
      first_name:'s',
      last_name:'d',
      password: '111111',
      password_confirmation: '111111')
      @user2.save

    expect(@user2).to be_valid

    end

    it "is not valid without minimum password length of 6" do
      
      @user = User.new(
      email: "a@a.com",
      password: '111',
      first_name:'s',
      last_name:'d',
      password_confirmation: '111')

      @user.save
    
    expect(@user).to_not be_valid
    end

    it "is valid with minimum password length of 6" do
      
      @user = User.new(
      email: "a@a.com",
      password: '1111111',
      first_name:'s',
      last_name:'d',
      password_confirmation: '1111111')

      @user.save
    
    expect(@user).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do # not working

    it "can log in with valid credentials" do

      @user = User.create!(
      email: "x",
      first_name:'s',
      last_name:'d',
      password: 'xxxxxxxsssssss',
      password_confirmation: 'xxxxxxxsssssss')
      @user.save

      @validUser = User.authenticate_with_credentials(@user.email,@user.password)

      expect(@validUser).to be_valid
    end

    it "cannot log in with invalid credentials" do
      
      @validUser = User.authenticate_with_credentials('ssssadsfs','dsafgd')
    
    expect(@validUser).to be_falsy
    end

   

  end




end

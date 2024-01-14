require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'ensures the user with all required fields successfully created' do
      user = User.new(
        first_name: "Peter",
        last_name: "Pan",
        email: "test@gmail.com",
        password: "password",
        password_confirmation: "password"
        )
        expect(user). to be_valid
      end

     it 'throw an error if password and password confirmation are not matching' do
      user = User.new(
        first_name: "Peter",
        last_name: "Pan",
        email: "test@gmail.com",
        password: "password",
        password_confirmation: "passwordquayskk"
        )
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'is not valid if all required fields are empty' do
        user = User.new
          expect(user).to_not be_valid
          expect(user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Email can't be blank", 
          "Password can't be blank")
        end
      
      it 'throw an error if password is too short' do
        user = User.new(
        first_name: "Peter",
        last_name: "Pan",
        email: "test@gmail.com",
        password: "123",
        password_confirmation: "123"
        )
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end


      it 'is not valid if email is not unique' do
        user = User.create(
        first_name: "Peter",
        last_name: "Pan",
        email: "test@gmail.com",
        password: "password",
        password_confirmation: "password"
        )

        user = User.new(
        first_name: "Peter",
        last_name: "Black",
        email: "TEST@gmail.com",
        password: "newpassword",
        password_confirmation: "newpassword"
        )
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email has already been taken")
      end

    

  describe '.authenticate_with_credentials' do
    
    it 'returns user if authenticate' do
      user = User.create(
      first_name: "Peter",
      last_name: "Pan",
      email: "test@gmail.com",
      password: "password",
      password_confirmation: "password"
      )
      authenticated_user = User.authenticate_with_credentials('test@gmail.com', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'returns nil with incorrect password' do
      user = User.create(
      first_name: "Peter",
      last_name: "Pan",
      email: "test@gmail.com",
      password: "password",
      password_confirmation: "password"
      )
      authenticated_user = User.authenticate_with_credentials('test@gmail.com', 'incorrectpassword')
      expect(authenticated_user).to be_nil
    end

    
    it 'ignores spaces in email' do
      user = User.create(
      first_name: "Peter",
      last_name: "Pan",
      email: "test@gmail.com",
      password: "password",
      password_confirmation: "password"
      )
      authenticated_user = User.authenticate_with_credentials(' test@gmail.com ', 'password')
      expect(authenticated_user).to eq(user)
    end

     it 'is not case in email' do
      user = User.create(
      first_name: "Peter",
      last_name: "Pan",
      email: "test@gmail.com",
      password: "password",
      password_confirmation: "password"
      )
      authenticated_user = User.authenticate_with_credentials('TEST@gmail.com', 'password')
      expect(authenticated_user).to eq(user)
    end


  end
end
end

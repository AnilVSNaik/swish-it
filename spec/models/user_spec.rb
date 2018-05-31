require 'rails_helper'

RSpec.describe User, type: :model do
  let(:proper_email)		{ 'thisemail@email.com' }
	let(:proper_password)	{ SecureRandom.base64[0..8] }
	let(:first_name) { 'John' }
	let(:last_name) { 'Doe' }
	let(:username) { 'anon' }
	let(:birthday) { '13-03-1999' }
	let(:improper_email)	{ 'ab@yz' }
	let(:improper_password)	{ '1b2' }
	let(:token) { SecureRandom.hex(10) }
	let(:no_token) { nil }


	context "validation: " do
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to allow_value(proper_email).for(:email) }
		it { is_expected.not_to allow_value(improper_email).for(:email)  }
		it { is_expected.to validate_presence_of(:password) }
		it { is_expected.not_to allow_value(improper_password).for(:password)  }
		it { is_expected.to validate_presence_of(:first_name) }
		it { is_expected.to validate_presence_of(:last_name) }
		it { is_expected.to validate_presence_of(:username) }
		it { is_expected.to validate_presence_of(:birthday) }
		it { is_expected.to validate_presence_of(:remember_token) }
		it { is_expected.not_to allow_value(no_token).for(:remember_token)  }
	end

	context "associations: " do
		it "should have many authentications" do
	    auth = User.reflect_on_association(:authentications)
	    expect(auth.macro).to eq(:has_many)
	  end

		it "should have many lists" do
	    lists = User.reflect_on_association(:lists)
	    expect(lists.macro).to eq(:has_many)
	  end

		it "should have many tasks" do
	    tasks = User.reflect_on_association(:tasks)
	    expect(tasks.macro).to eq(:has_many)
	  end
	end

	context "creates: " do
		it "takes in one valid email, password, first_name, last_name, username and birthday" do
			expect{ User.create(email: proper_email, 
													password: proper_password, 
													first_name: first_name, 
													last_name: last_name, 
													username:username, 
													birthday:birthday) }.not_to raise_error
		end

		it "is a proper user" do
			user = User.create(email: proper_email, 
													password: proper_password, 
													first_name: first_name, 
													last_name: last_name, 
													username:username, 
													birthday:birthday)
			expect(user.email).to eq("thisemail@email.com")
			expect(user.username).to eq("anon")
		end

		it "won't create an entry if only one valid email is being supplied" do
			User.create(email: proper_email)
			expect( User.find_by(email: proper_email) ).to be nil
		end		
	end
end

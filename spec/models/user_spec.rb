require 'rails_helper'

RSpec.describe User, type: :model do
  let(:proper_email)		{ 'example@email.com' }
	let(:proper_password)	{ SecureRandom.base64[0..8] }
	let(:first_name) { 'John' }
	let(:last_name) { 'Doe' }
	let(:username) { 'anon' }
	let(:birthday) { '13-03-1999' }
	let(:improper_email)	{ 'ab@yz' }


	context "validation: " do
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to allow_value(proper_email).for(:email) }
		it { is_expected.not_to allow_value(improper_email).for(:email)  }
		it { is_expected.to validate_presence_of(:password) }
		it { is_expected.to validate_presence_of(:first_name) }
		it { is_expected.to validate_presence_of(:last_name) }
		it { is_expected.to validate_presence_of(:username) }
		it { is_expected.to validate_presence_of(:birthday) }
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

		it "won't create an entry if only one valid email is being supplied" do
			User.create(email: proper_email)
			expect( User.find_by(email: proper_email) ).to be nil
		end

		it "creates an entry when 2 inputs with proper_email is being supplied" do
			User.create(email: proper_email, 
													password: proper_password, 
													first_name: first_name, 
													last_name: last_name, 
													username:username, 
													birthday:birthday)
			expect( User.find_by(email: proper_email) ).not_to be nil
		end
	end

	# tbc
	# context "self.retrieve_password: " do
	# 	it "takes in one valid email" do
	# 		expect{ User.retrieve_password(proper_email) }.not_to raise_error
	# 	end

	# 	it "returns nil when proper email is not found" do
	# 		expect( User.retrieve_password(proper_email) ).to be nil
	# 	end

	# 	it "returns password when proper email is found" do
	# 		User.create(email: proper_email, password: proper_password)
	# 		expect( User.retrieve_password(proper_email) ).to eq proper_password
	# 	end
	# end
end

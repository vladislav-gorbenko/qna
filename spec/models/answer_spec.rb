require 'rails_helper'

RSpec.describe Answer, type: :model do

	describe 'assotiations' do 
		it {should belong_to(:question)}
	end

	describe 'validation'
		it {should validate_presence_of :body}
		it {should validate_presence_of :question_id}
	end
end

require 'rails_helper'

RSpec.describe Answer, type: :model do

	it {should belong_to(:question)}

	it {should validate_presence_of(:body)}
	it {should validate_presence_of(:question_id)}
	it { should validate_length_of(:body).is_at_least(5).is_at_most(3000) }
end

require 'rails_helper'

RSpec.describe Question, type: :model do

		it {should have_many(:answers)}

	  it {should validate_presence_of :title}
	  it {should validate_presence_of :body}
		it { should validate_length_of(:title).is_at_least(10).is_at_most(256) }
	  it {should validate_length_of(:body).is_at_least(5).is_at_most(3000) }



	describe 'when remove question should remove answers' do
		let!(:question_1){FactoryGirl.create(:question, title:'Hello world!', body: "How do it say simply?")}
		let!(:answer_1){FactoryGirl.create(:answer, body: "Try to do it by ruby", question_id: question_1.id)}
		let!(:answer_2){FactoryGirl.create(:answer, body: "Try to do it by js", question_id: question_1.id)}

		it 'add answers to question' do
			expect(question_1.answers.count).to eq(2)
		end

		it 'remove question and answers' do
			expect{question_1.destroy}.to change{Answer.count}.by(-2)
		end
	end
end

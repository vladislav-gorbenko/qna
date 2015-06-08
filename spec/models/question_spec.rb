require 'rails_helper'

RSpec.describe Question, type: :model do
	describe 'assotiations' do
		it {should have_many(:answers)}
	end

	describe 'validation' do
	  it {should validate_presence_of :title}
	  it {should validate_presence_of :body}
	end

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

require 'spec_helper'

RSpec.describe 'Parameters Test' do
  describe 'Check internal date and other params' do
    let(:params) do
      {
        colon_format: File.read('spec/fixtures/people_by_colon.txt'),
        order: :first_name,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'Invalid date check..doesnt parse invalid date' do
      normalized_people = people_controller.normalize 
      expect(normalized_people).to eq [
        'Grand, Atlanta, 1986-13-29',
        'Text, New York City, 5/4/1947'
      ]
    end
  end
end
require 'spec_helper'

RSpec.describe 'App Extra Functional Test' do
  describe 'hash formats sorted by first_name' do
    let(:params) do
      {
        hash_format: File.read('spec/fixtures/people_by_hash.txt'),
        order: :first_name,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      expect(normalized_people).to eq [
        "Andrew, New York City, 5/4/1954", 
        "Zebra, Atlanta, 5/29/1980"
      ]
    end
  end
end
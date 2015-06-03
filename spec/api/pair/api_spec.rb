require 'rails_helper'

describe Pair::API do
  describe 'POST /api/coffee' do
    it 'sets a person as available' do
      post "/api/coffee"
      verify_response 200
    end
  end
end
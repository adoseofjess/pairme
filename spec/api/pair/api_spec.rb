require 'rails_helper'

describe Pair::App do
  context 'when the user does not exist yet' do
    describe 'POST /api/coffee' do
      it 'creates a user and sets user as available but not permanent' do
        post "/api/coffee", user_name: "Something"
        expect(User.where(name: "Something", available: true, permanent: nil)).to exist
      end

      it 'creates a user and sets user as available and permanent' do
        post "/api/coffee", user_name: "Something", permanent: true
        expect(User.where(name: "Something", available: true, permanent: true)).to exist
      end
    end
  end

  context 'when the user exists' do
    let!(:user) { User.create(name: "Something") }

    it 'sets the user as available but not permanent' do
      post "/api/coffee", user_name: "Something"
      expect(user.reload.available).to be true
      expect(user.permanent).to be nil
    end

    it 'sets the user as available and permanent' do
      post "/api/coffee", user_name: "Something", permanent: true
      expect(user.reload.available).to be true
      expect(user.permanent).to be true
    end
  end
end
module Pair
  class API < Grape::API
    version 'v1', using: :header, vendor: 'pair'
    format :json
    prefix :api

    resource :coffee do

      # =====================
      # = POST /api/coffee/ =
      # =====================

      desc "Post availability for a coffee pair date."
      params do
        requires :user_name, type: String, desc: "The slack user name of the person who wants coffee."
      end
      post do
        user = User.find_or_create_by(name: params.user_name)
      end
    end
  end
end
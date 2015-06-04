require 'grape'
require 'pry'
module Pair
  class App < Grape::API
    format :json
    prefix :api

    resource :coffee do
      # =====================
      # = POST /api/coffee/ =
      # =====================

      desc "Post availability for a coffee pair date."
      params do
        requires :user_name, type: String, desc: "The slack user name of the person who wants coffee."
        optional :permanent, type: Boolean, desc: "Whether this user is always available."
      end
      post do
        if params.permanent
          user = User.find_or_create_by(name: params.user_name)
          user.update_attributes(available: true, permanent: true)
          user.save
        else
          user = User.find_or_create_by(name: params.user_name)
          user.update_attributes(available: true)
          user.save
        end
      end
    end
  end
end
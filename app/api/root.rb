# frozen_string_literal: true

class Root < Grape::API
  format :json

  get '/' do
    status :ok
  end
end

# frozen_string_literal: true

module V1
  class Devices < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :devices do
      desc 'Get users devices'
      params do
        requires :user_id
      end
      get do
        Device.where(user_id: params[:user_id])
      end

      desc 'Create new device'
      params do
        requires :user_id
        requires :device_type
      end
      post do
        Device.create!(params)
      end
    end
  end
end

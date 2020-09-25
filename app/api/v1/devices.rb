# frozen_string_literal: true

module V1
  class Devices < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :devices do
      desc 'Get users devices'
      params do
        requires :user_id, type: Integer
      end
      get do
        Device.where(user_id: params[:user_id])
      end

      desc 'Create new device'
      params do
        requires :user_id, type: Integer
        requires :entity_type, type: String
      end
      post do
        user = User.find_by_id(params[:user_id])
        entity = params[:entity_type].capitalize.constantize.create!
        Device.create!(user: user, entity: entity)
      end
    end
  end
end

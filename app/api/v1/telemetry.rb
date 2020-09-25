# frozen_string_literal: true

module V1
  class Telemetry < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :telemetry do
      desc 'Add tablets sensor checks'
      params do
        requires :tablet_id, type: Integer
        requires :sensor_checks, type: Array[JSON] do
          requires :time, type: DateTime
          requires :sensor_type_id, type: Integer
          requires :value, type: Float
        end
      end
      post do
        ActiveRecord::Base.transaction do
          params[:sensor_checks].each do |sensor_check|
            SensorCheck.create!(time: sensor_check[:time],
                                sensor_type_id: sensor_check[:sensor_type_id],
                                value: sensor_check[:value],
                                tablet_id: params[:tablet_id])
          end
        end
      end
    end
  end
end

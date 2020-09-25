# frozen_string_literal: true

require 'rails_helper'

describe V1::Telemetry do
  let(:tablet) { Tablet.create }

  describe 'POST /api/v1/telemetry' do
    let(:params) do
      {
        tablet_id: tablet.id,
        sensor_checks: [
          {"time": "2020-09-21 10:00:00", "sensor_type_id": "1", "value": "0.3"},
          {"time": "2020-09-20 10:10:00", "sensor_type_id": "2", "value": "0.9"}
        ]
      }
    end
  
    it 'return the proper attributes' do
      expect { post '/api/v1/telemetry', params: params }
        .to change(SensorCheck, :count).by(2)
    end
  end
end

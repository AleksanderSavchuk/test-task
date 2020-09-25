# frozen_string_literal: true

require 'rails_helper'

describe V1::Reports do
  let(:tablet) { Tablet.create }
  let!(:sensor_check) { SensorCheck.create(tablet_id: tablet.id, time: '2020-09-20 11:00:00', value: 3.8, sensor_type_id: 1) }
  let!(:sensor_check1) { SensorCheck.create(tablet_id: tablet.id, time: '2020-09-20 11:30:00', value: 3.8, sensor_type_id: 1) }
  let!(:sensor_check2) { SensorCheck.create(tablet_id: tablet.id, time: '2020-09-20 11:00:00', value: 3.8, sensor_type_id: 2) }
  let!(:sensor_check3) { SensorCheck.create(tablet_id: tablet.id, time: '2020-09-20 11:30:00', value: 3.8, sensor_type_id: 2) }

  describe 'GET /api/v1/reports' do
    before do
      get "/api/v1/reports?tablet_id=#{tablet.id}"
    end

    it 'return the proper attributes' do
      expect(JSON.parse(response.body).count).to eq 2
    end
  end
end

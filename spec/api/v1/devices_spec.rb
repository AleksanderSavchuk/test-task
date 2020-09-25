# frozen_string_literal: true

require 'rails_helper'

describe V1::Devices do
  # Ususally I use FactoryBot
  let(:user) { User.create(name: 'Test') }
  let!(:device) { Device.create(user: user) }

  describe 'GET /api/v1/devices' do
    before do
      get "/api/v1/devices?user_id=#{user.id}"
    end

    it 'return the proper attributes' do
      expect(JSON.parse(response.body)[0]['id']).to eq device.id
    end
  end

  describe 'POST /api/v1/devices' do
    let(:params) { { user_id: user.id, device_type: 'mobile_phone' } }

    it 'return the proper attributes' do
      expect { post "/api/v1/devices?user_id=#{user.id}", params: params }
        .to change(Device, :count).by(1)
    end
  end
end

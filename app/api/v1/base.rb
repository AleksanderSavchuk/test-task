# frozen_string_literal: true

module V1
  class Base < Grape::API
    mount V1::Devices
    mount V1::Reports
    mount V1::Telemetry
  end
end

# frozen_string_literal: true

class Tablet < ApplicationRecord
  has_one :device, as: :entity

  has_many :sensor_checks, dependent: :destroy
end

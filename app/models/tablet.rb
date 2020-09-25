# frozen_string_literal: true

class Tablet < ApplicationRecord
  belongs_to :device
  has_many :sensor_checks, dependent: :destroy
end

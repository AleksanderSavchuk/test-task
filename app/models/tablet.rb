# frozen_string_literal: true

class Tablet < ApplicationRecord
  has_many :sensor_checks
end

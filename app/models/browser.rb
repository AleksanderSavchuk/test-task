# frozen_string_literal: true

class Browser < ApplicationRecord
  has_one :device, as: :entity
end

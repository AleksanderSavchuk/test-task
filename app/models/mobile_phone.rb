# frozen_string_literal: true

class MobilePhone < ApplicationRecord
  has_one :device, as: :entity
end

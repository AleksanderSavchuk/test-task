# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :user
  has_one :mobile_phone
  has_one :tablet
  has_one :browser

  enum device_type: {
    tablet: 0,
    mobile_phone: 1,
    browser: 2
  }
end

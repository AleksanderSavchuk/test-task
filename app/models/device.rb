# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :user
  has_one :mobile_phone, dependent: :destroy
  has_one :tablet, dependent: :destroy
  has_one :browser, dependent: :destroy

  enum device_type: {
    tablet: 0,
    mobile_phone: 1,
    browser: 2
  }
end

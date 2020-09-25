# frozen_string_literal: true

class User < ApplicationRecord
  has_many :devices, dependent: :destroy
end

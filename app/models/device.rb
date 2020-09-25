# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :user
  belongs_to :entity, polymorphic: true
end

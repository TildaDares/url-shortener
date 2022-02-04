require 'securerandom'

class Link < ApplicationRecord
  validates :url, presence: true
  before_save :generate_slug

  def generate_slug
    self.slug = SecureRandom.alphanumeric
  end

  def display_slug
    "http://localhost:3000/" + self.slug
  end
end

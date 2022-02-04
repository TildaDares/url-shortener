require 'securerandom'

class Link < ApplicationRecord
  validates :url, presence: true
  before_save :generate_slug

  def generate_slug
    self.slug = SecureRandom.alphanumeric
  end

  def display_slug
    ENV['BASE_URL'] + self.slug
  end
end

class Message < ApplicationRecord
    validates :body, presence: true
    belongs_to :user
    scope :custome_display, -> { order(:created_at).last(20) }
end

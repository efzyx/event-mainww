class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :team, optional: true
end

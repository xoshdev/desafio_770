class Twiter < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: [:description, :user_name], using: {
      tsearch: { prefix: true }
    }
  end
  

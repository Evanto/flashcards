class Card < ApplicationRecord
  validates  :translated_text, presence: { message: 'Все поля должны быть заполнены!' }
  validate  :fields_not_equal, { message: 'Содержимое полей должно отличаться!' }
  before_create :set_review_date_to_now

  def fields_not_equal
    #if self.original_text.downcase == self.translated_text.downcase
    errors.add(:translated_text, "can't be the same as email") if if self.original_text.downcase == self.translated_text.downcase
     #end
  end

  def set_review_date_to_now
     self.review_date = Time.current
  end

end

class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: { message: 'Все поля должны быть заполнены!' }
  validate  :fields_not_equal
  validate  :set_review_date_to_now

  private

  def fields_not_equal
    if self.original_text.to_s.downcase == self.translated_text.to_s.downcase
    errors.add(:original_text, "Не может совпадать с ответом") 
    errors.add(:translated_text, "Не может совпадать с вопросом")
    end
  end

  def set_review_date_to_now
     self.review_date = Time.current
  end

end

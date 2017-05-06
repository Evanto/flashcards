class Card < ApplicationRecord
  #validates :original_text, :translated_text, presence: true
  validates  :translated_text, presence: { message: 'Ошибка ассоциации.' }
  # validates :original_text, :translated_text, uniqueness: true
  validate  :fields_not_equal
#  before_validation :set_review_date_to_now, on: :create
  before_create :set_review_date_to_now

  def fields_not_equal
    if self.original_text.downcase == self.translated_text.downcase
    #   self.errors.add( :original_text,:must_be_diff_w_transl)
      # self.errors.add(:base, "Поля не должны совпадать!")
    #if original_text.mb_chars.downcase.to_s == translated_text.mb_chars.downcase.to_s
     errors[:base] << "Вопрос и ответ должны отличаться!"
    end
  end



  def set_review_date_to_now
     #self.review_date = Date.today
     self.review_date = Time.current
  end

end

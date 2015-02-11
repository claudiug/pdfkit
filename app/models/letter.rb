class Letter < ActiveRecord::Base
  validates :name, :email, :link, presence: true
  validates :key, uniqueness: true

  before_validation :generate_key

  private

  def generate_key
    #TODO loop over the keys and before save check if there are unique
    token = "#{SecureRandom.urlsafe_base64}__#{Time.now.to_i}__#{SecureRandom.urlsafe_base64}"
    self.key = token unless Letter.where(key: token).first
  end
end

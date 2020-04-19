class Transaction < ApplicationRecord
  belongs_to :bank_account

  TYPES = ['withdraw', 'deposit']

  validates :bank_account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true, inclusion: { in: TYPES }

  before_validation :uniq_transaction_number

  def uniq_transaction_number
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end
end

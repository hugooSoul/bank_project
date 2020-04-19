class BankAccount < ApplicationRecord
  belongs_to :client

  validates :client, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true

  before_validation :default_balance

  has_many :transactions

  def default_balance
    if self.new_record?
      self.balance = 0.00
    end
  end
end

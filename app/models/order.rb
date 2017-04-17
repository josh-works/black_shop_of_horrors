class Order < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user
  has_many :invoices
  has_many :items, through: :invoices
  enum status: %w(Completed Paid Cancelled Ordered)

  def total_cost
    cost = 0
    self.invoices.each do |invoice|
      cost += invoice.total_cost_unformatted
    end
    number_to_currency(cost)
  end
end

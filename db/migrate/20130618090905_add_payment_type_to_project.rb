class AddPaymentTypeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :payment_type, :string
  end
end

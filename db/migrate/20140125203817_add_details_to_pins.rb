class AddDetailsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :pricing, :string
    add_column :pins, :user_review_summary, :decimal
  end
end

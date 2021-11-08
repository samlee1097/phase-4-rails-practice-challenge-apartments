class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :rent
      t.integer :apartment_id
      t.integer :tenant_id

      t.timestamps

      # rails g resourece lease rent:integer apartment:belongs_to  tenant:belongs_to
    end
  end
end

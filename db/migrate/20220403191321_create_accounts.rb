class CreateAccounts < ActiveRecord::Migration[7.0]
  def up
    create_enum "account_type", ["individual", "company"]

    create_table :accounts do |t|
      t.enum :account_type, enum_type: "account_type", null: false, default: "individual"
      t.string :name, null: false
      t.string :company_number
      t.date :date_of_birth
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end

  def down
    drop_table :accounts
    execute <<-SQL
      DROP TYPE account_type;
    SQL
  end
end

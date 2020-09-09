class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.text :languages
      t.string :nationality

      t.integer :role, default: 0

      t.timestamps
    end
  end
end

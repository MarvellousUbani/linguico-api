class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.text :languages
      t.string :nationality

      t.timestamps
    end
  end
end

class AddUsersBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :books do |t|
      t.string :name
      t.text :description
    end

    create_join_table :users, :books do |t|
      t.integer :score

      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end

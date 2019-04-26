class AddArticlesAndBooks < ActiveRecord::Migration[5.2]
  def change
      create_table :library do | t |
        t.timestamps
      end

      create_table :articles do | t |
        t.timestamps
        t.references :library, null: false, index: true
        t.string :url, null: false
        t.text :description
      end

      add_foreign_key :articles, :library

      create_table :book do | t |
        t.timestamps
        t.references :library, null: false, index: true
        t.string :url
        t.string :title, null: false
        t.string :author, null: false
        t.text :description
        t.boolean :owned_by_mojotech
      end

      add_foreign_key :book, :library
  end
end

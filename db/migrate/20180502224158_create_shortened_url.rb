class CreateShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.text :long_url, null: false
      t.text :short_url, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :long_url
    add_index :shortened_urls, :user_id
  end
end
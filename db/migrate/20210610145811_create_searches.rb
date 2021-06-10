class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :origin
      t.string :destination
      t.integer :passengers
      t.string :departure
      t.string :return_date
      t.string :max_price
      t.string :limit
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end

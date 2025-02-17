class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.timestamps

      t.string :title
      t.string :description
    end
  end
end

class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods, comment: "料理" do |t|
      t.string :name, null: false, comment: "料理名"
      t.text :comment, comment: "コメント"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

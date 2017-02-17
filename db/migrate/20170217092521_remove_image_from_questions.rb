class RemoveImageFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :image, :string
  end
end

class ChangeDataAnswerToComments < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :answer, :text
  end
end

class RemoveCommentableIdIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_id_id, :string
  end
end

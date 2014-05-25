class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :commentable_id, index: true
    add_column :comments, :commentable_type, :string
  end
end

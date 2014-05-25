class AddPostsAndUserRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :post, index: true
    add_reference :comments, :user, index: true
  end
end

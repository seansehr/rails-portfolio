class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, foreign_key: "author_id"
  has_many :comments

  def author?
    self.role == 'author'
  end

  def editor?
    self.role == 'editor'
  end
end

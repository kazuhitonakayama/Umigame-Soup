class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :answers,dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post #userがどの投稿をいいねしているのかを簡単に取得できるようになります
  # ユーザーが投稿に対して、すでにいいねをしているのかどうかを判定することができるようにuser.rbで、already_liked?を定義します。
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

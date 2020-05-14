class Post < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :liked_users, through: :likes, source: :user # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります。
end

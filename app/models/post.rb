class Post < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :answers, dependent: :destroy
    belongs_to :user
    has_many :liked_users, through: :likes, source: :user # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります。
    def already_liked?(post)
        self.likes.exists?(post_id: post.id)
    end
end

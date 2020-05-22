class Post < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :answers, dependent: :destroy
    belongs_to :user
    has_many :liked_users, through: :likes, source: :user # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります。
    def already_liked?(post)
        self.likes.exists?(post_id: post.id)
    end
    def self.create_all_ranks # ランキング機能のための記述！
        Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    end
end

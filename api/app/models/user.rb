class User < ApplicationRecord
   #Auth0の実装
   def self.from_token_payload(payload)
    find_by(sub: payload['sub']) || create!(sub: payload['sub'])
　　end

    has_many :active_relationships, class_name: "Relationship",
                 foreign_key: "follower_id",
                 #自分がフォローしているユーザーのDBにある自分のidも消える。
                 dependent: :destroy

    has_many :passive_relationships, class_name:  "Relationship",
                    foreign_key: "followed_id",
                    dependent:   :destroy
                 
    #following配列の元はfollowed idの集合である (sourceについて)             
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    has_many :microposts, dependent: :destroy
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    #実験。まだ完成ではない。
    def feed
        Post.where("user_id=?", id)
    end

      # ユーザーをフォローする
      #<<は、要素を配列の最後に追記する事ができる
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end


    # 渡された文字列のハッシュ値を返す
#   def User.digest(string)
#     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
#                                                   BCrypt::Engine.cost
#     BCrypt::Password.create(string, cost: cost)
#   end

    
end

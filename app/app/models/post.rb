class Post < ApplicationRecord
  belongs_to :user
  #一つのpostに何枚でもimageを貼る事ができる。
  has_many_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 5000 }
  #画像の設定についてはまだ。

  #これ画像のバリデーション
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
  message: "must be a valid image format" }
# 　  size:         { less_than: 5.megabytes,
#     message: "should be less than 5MB" }

  #gem 'image_processing',mini_magick'の追加設定
    #リサイズ済み画像を返す
  #   def display_image
  #   image.variant(resize_to_limit: [500, 500])
  # end
end

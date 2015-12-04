class Spot < ActiveRecord::Base

   belongs_to :user
   #新しいものから並ぶようにする
   default_scope -> { order(created_at: :desc) }

   #画像アップロード
   mount_uploader :picture, PictureUploader

   #バリデーション
   validates :user_id, presence: true
   validates :title, presence: true
   validates :content, presence: true, length: { maximum: 200 }
   validates :place, presence: true

end

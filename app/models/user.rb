class User < ActiveRecord::Base
  
  #saveする前にアドレスを小文字に統一して一意性保つ
  before_save { self.email = email.downcase }

  #コンテンツとの関係
  has_many :spots

  #写真アップロード
  mount_uploader :picture, PictureUploader

  #名前とアドレスのバリデーション
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  #パスワード設定
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


   # 与えられた文字列のハッシュ値を返す 
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  #deviseでOumniAuthを使用できるように編集
  has_many :sns_credentials, dependent: :destroy

  def self.from_omniauth(auth)  #Userモデルに入るデータなので、Userモデルにクラスメソッドを作成,Userクラスで使用できるメソッド.
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create!
    #取得した情報内の「provider」と「uid」をsnsに代入してfirst_or_createメソッドを用いています。
    #そこで、SNS認証を行ったことがあるかを判断して、データベースに保存しています。保存することで、ログインの際にUserモデルとSnsCredentialモデルを紐付けます。
    #binding.pry
    
   # sns認証したことがあればアソシエーションで取得
   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
  )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
   end
end

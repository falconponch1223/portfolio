class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post,dependent: :destroy

  enum gender: { 男性: 0, 女性: 1, 回答しない:2}

  enum age: { 未成年:0, 二十代: 1, 三十代: 2, 四十代: 3, 五十代: 4, その他: 5 }

  enum industry: { 農林業または水産業:0, 建設業または土木業:1, 工業または製造業:2, 電気またはガス等の都市インフラ業:3, 通信業:4, 情報サービス業:5,
      運輸業または郵便業:6, 卸売業または小売業:7, 金融業または保険業:8, 不動産業または賃貸業:9, 研究者または専門技術者:10,
      宿泊業または飲食サービス業:11, 教育または学習支援業:12, 医療または福祉関連:13, 官公庁または地方自治体等:14, その他業種:15}

  enum job: { 会社員: 0, 公務員: 1,自営業: 2, 会社役員: 3, 専業主婦:4, 学生:5, パート:6, 無職:7, その他職種:8 }
  
end

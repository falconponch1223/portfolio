class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  attachment :image

  enum genre: { 懐石・割烹料理: 0, 寿司・海鮮料理: 1, 天ぷら・揚げ物:2, うなぎ・そば・うどん:3, 
               すき焼き・鍋物:4, ステーキ・鉄板料理:5, 焼き肉:6, 創作料理:7, 郷土料理:8, その他和食:9, 
               フレンチ:10, イタリアン:11, その他洋風・西洋料理:12, 中華料理:13, その他アジアン料理:14, 
               バー:15, キャバクラ・ラウンジ:16, その他飲食店:17}
  enum mood: { 明るく、にぎやか: 0, 静かで、落ち着いている: 1, おしゃれ:2, その他:3}
  enum use: { 接待: 0, 社内イベント: 1, 宴会: 2, 合コン: 3, 誕生日・各種記念日: 4, 結婚式二次会: 5,
              法事: 6, 飲み会・食事会: 7, その他祝い事等: 8}
  enum seat: {カウンター席: 0, テーブル席: 1,座敷: 2,その他席タイプ: 3}
  enum private: { 完全個室: 0, 半個室: 1, なし:2}
  enum smoking: { 喫煙可: 0, 分煙: 1, 禁煙:2}
end

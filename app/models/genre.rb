class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: 'ホラー'},
    {id: 2, name: 'アクション'},
    {id: 3, name: 'サスペンス'},
    {id: 4, name: 'SF'},
    {id: 5, name: 'ファンタジー'},
    {id: 6, name: '恋愛'},
    {id: 7, name: 'コメディー'},
    {id: 8, name: 'スポーツ'},
    {id: 9, name: 'アニメ'},
    {id: 10, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :movies
end
# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  content_post :text             not null
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :content_post, presence: true
  validates :content_post, length: { minimum: 250 }
end

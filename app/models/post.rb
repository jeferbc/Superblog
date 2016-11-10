# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  tittle       :string
#  subtitle     :string
#  content_post :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
end

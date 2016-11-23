# == Schema Information
#
# Table name: comments
#
#  id              :integer          not null, primary key
#  comment_content :text             not null
#  user_id         :integer
#  post_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment_content, presence: true
end

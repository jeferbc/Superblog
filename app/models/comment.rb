# == Schema Information
#
# Table name: comments
#
#  id              :integer          not null, primary key
#  comment_content :text
#  post_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :post
end

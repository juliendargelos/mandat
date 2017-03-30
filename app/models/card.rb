# == Schema Information
#
# Table name: cards
#
#  id                 :integer          not null, primary key
#  title              :string
#  desc               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  budget_oui         :integer
#  employers_oui      :integer
#  population_oui     :integer
#  budget_non         :integer
#  employers_non      :integer
#  population_non     :integer
#

class Card < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

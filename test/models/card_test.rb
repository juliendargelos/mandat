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

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: data_imports
#
#  id                :integer          not null, primary key
#  role_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  model             :integer
#  status            :integer          default(-1)
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_updated_at   :datetime
#
# Indexes
#
#  index_data_imports_on_role_id  (role_id)
#

require 'test_helper'

class DataImportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

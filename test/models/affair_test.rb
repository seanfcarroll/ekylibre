# = Informations
#
# == License
#
# Ekylibre - Simple agricultural ERP
# Copyright (C) 2008-2009 Brice Texier, Thibaud Merigon
# Copyright (C) 2010-2012 Brice Texier
# Copyright (C) 2012-2016 Brice Texier, David Joulin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# == Table: affairs
#
#  accounted_at           :datetime
#  cash_session_id        :integer
#  closed                 :boolean          default(FALSE), not null
#  closed_at              :datetime
#  created_at             :datetime         not null
#  creator_id             :integer
#  credit                 :decimal(19, 4)   default(0.0), not null
#  currency               :string           not null
#  dead_line_at           :datetime
#  deals_count            :integer          default(0), not null
#  debit                  :decimal(19, 4)   default(0.0), not null
#  description            :text
#  id                     :integer          not null, primary key
#  journal_entry_id       :integer
#  lock_version           :integer          default(0), not null
#  name                   :string
#  number                 :string           not null
#  origin                 :string
#  pretax_amount          :decimal(19, 4)   default(0.0)
#  probability_percentage :decimal(19, 4)   default(0.0)
#  responsible_id         :integer
#  state                  :string
#  third_id               :integer          not null
#  third_role             :string           not null
#  type                   :string
#  updated_at             :datetime         not null
#  updater_id             :integer
#
require 'test_helper'

class AffairTest < ActiveSupport::TestCase
  test_model_actions
  # check that every model that can be affairable
  test 'affairables classes' do
    for type in Affair.affairable_types
      model = type.constantize
      assert model.respond_to?(:deal_third), "Model #{type} cannot be used with affairs"
    end
  end

  # test "deals attachment" do
  #   affair = affairs(:affairs_003)
  #   deals = [incoming_payments(:incoming_payments_001), sales(:sales_001)]
  #   for deal in deals
  #     affair.attach(deal)
  #   end
  #   assert_equal (deals.size + 1), affair.deals_count, "The deals count is invalid"
  # end
end
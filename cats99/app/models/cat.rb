# == Schema Information
#
# Table name: cats
#
#  id                                                              :bigint(8)        not null, primary key
#  birth_date                                                      :date             not null
#  color                                                           :text             not null
#  name                                                            :text             not null
#  sex                                                             :text             not null
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  description                                                     :text
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :text
#

require 'date'

class Cat < ApplicationRecord
  COLORS =   ['pink','blue','neon green']
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: {in: COLORS}
  validates :sex, inclusion: {in: ['m','f']}

  

  def age
    birth_date = self.birth_date
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end



end

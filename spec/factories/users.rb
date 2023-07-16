# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  avatar                    :string
#  username                    :string
#  email                     :string           default(""), not null
#  encrypted_password        :string           default(""), not null
#  reset_password_token      :string
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  slug                      :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_users_on_username     (username) UNIQUE
#  index_users_on_email     (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug      (slug) UNIQUE

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { "#{Faker::Name.first_name.downcase} #{Faker::Name.last_name.downcase}"}
    password { '1234567890' }
    slug { Faker::Internet.unique.slug }
  end
end

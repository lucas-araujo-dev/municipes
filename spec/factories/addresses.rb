# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    uf { Faker::Address.state }
    zipcode { '64010-555' }
    complement { Faker::Address.secondary_address }
    ibge_code { Faker::Number.number(digits: 7) }
    association :municipe, factory: :municipe
  end
end

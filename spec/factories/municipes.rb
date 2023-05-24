# frozen_string_literal: true

require 'cns_brazil/generator'

FactoryBot.define do
  factory :municipe do
    full_name { Faker::Name.name }
    cpf { Faker::CPF.number }
    cns { CnsBrazil::Generator.new.call }
    email { Faker::Internet.unique.email }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.cell_phone }

    after(:build) do |municipe|
      municipe.picture.attach(io: Rails.root.join('spec/fixtures/files/avatar.jpg').open, filename: 'avatar.png')
    end
  end
end

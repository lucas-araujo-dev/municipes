# frozen_string_literal: true

require 'cns_brazil/generator'

FactoryBot.define do
  factory :municipe do
    full_name { Faker::Name.name }
    cpf { Faker::CPF.formatted }
    cns { CnsBrazil::Generator.new.call }
    email { Faker::Internet.unique.email }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { '+55 (88) 99778-7269' }
    picture do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/avatar.jpg'))
    end
  end
end

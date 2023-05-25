# frozen_string_literal: true

class Municipe < ApplicationRecord
  include Searchable

  enum status: { active: 'active', inactive: 'inactive' }

  has_one_attached :picture

  validates :full_name, :cpf, :cns, :email, :birthdate, :phone, :picture, presence: true
  validates :cpf, :cns, :email, uniqueness: { case_sensitive: false }
  validates :cpf, cpf: true
  validates :cns, '::CnsBrazil::Cns': true
  validates :full_name, :email, length: { maximum: 255 }
  validates :phone, length: { maximum: 15 }
  validates :birthdate, date: { before_or_equal_to: proc { Time.zone.now }, message: :invalid }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :full_name, type: 'text'
      indexes :cpf, type: 'text'
      indexes :cns, type: 'text'
      indexes :email, type: 'text'
      indexes :birthdate, type: 'date'
      indexes :phone, type: 'text'
    end
  end
end

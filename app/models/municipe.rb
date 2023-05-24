# frozen_string_literal: true

class Municipe < ApplicationRecord
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
end

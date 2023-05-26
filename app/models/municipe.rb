# frozen_string_literal: true

class Municipe < ApplicationRecord
  enum status: { active: 'active', inactive: 'inactive' }

  has_one :address, dependent: :destroy, inverse_of: :municipe

  has_one_attached :picture

  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank

  validates :full_name, :cpf, :cns, :email, :birthdate, :phone, :picture, presence: true
  validates :cpf, :cns, :email, uniqueness: { case_sensitive: false }
  validates :cpf, cpf: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/ }
  validates :cns, '::CnsBrazil::Cns': true
  validates :full_name, :email, length: { maximum: 255 }
  validates :phone, format: { with: /\A\+55\s\(\d{2}\)\s\d{5}-\d{4}\z/ }
  validates :birthdate, date: { before_or_equal_to: proc { Time.zone.now }, message: :invalid }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create :notify_welcome
  after_update :notify_updated

  def notify_welcome
    MunicipeMailer.welcome(self).deliver_later
  end

  def notify_updated
    MunicipeMailer.updated(self).deliver_later
  end
end

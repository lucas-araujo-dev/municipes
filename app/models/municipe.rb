# frozen_string_literal: true

class Municipe < ApplicationRecord
  include Searchable

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

  after_commit :notify_welcome, on: :create
  after_commit :notify_updated, on: :update

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :full_name, type: :text
      indexes :cpf, type: :text
      indexes :cns, type: :text
      indexes :email, type: :text
    end
  end

  # exclui o campo picture para nao ser indexado
  def as_indexed_json(_options = {})
    as_json(
      except: [:picture]
    )
  end

  def notify_welcome
    sms_message = I18n.t('sms.messages.welcome')

    MunicipeMailer.welcome(self).deliver_later
    SmsService.new(phone, sms_message).send_sms unless Rails.env.test?
  end

  def notify_updated
    sms_message = I18n.t('sms.messages.updated')

    MunicipeMailer.updated(self).deliver_later
    SmsService.new(phone, sms_message).send_sms unless Rails.env.test?
  end
end

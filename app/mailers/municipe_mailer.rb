# frozen_string_literal: true

class MunicipeMailer < ApplicationMailer
  default from: 'municipes@systems.com'

  def welcome(municipe)
    @municipe = municipe

    mail(to: @municipe.email, subject: t('mailers.municipe_mailer.created'))
  end

  def updated(municipe)
    @municipe = municipe

    mail(to: @municipe.email, subject: t('mailers.municipe_mailer.updated'))
  end
end

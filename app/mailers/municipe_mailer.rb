class MunicipeMailer < ApplicationMailer
  default from: 'municipes@systems.com'

  def welcome(municipe)
    @municipe = municipe

    mail(to: @municipe.email, subject: 'Bem-vindo ao nosso aplicativo')
  end

  def updated(municipe)
    @municipe = municipe

    mail(to: @municipe.email, subject: 'Municipe Atualizado')
  end
end

require 'rails_helper'

RSpec.describe MunicipeMailer, type: :mailer do
  describe 'welcome_email' do
    let(:municipe) { create(:municipe) }
    let(:mail) { MunicipeMailer.welcome(municipe) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Bem-vindo ao nosso aplicativo')
      expect(mail.to).to eq([municipe.email])
      expect(mail.from).to eq(['municipes@systems.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include(municipe.full_name)
      expect(mail.body.encoded).to include("Cadastro Realizado com Sucesso")
      expect(mail.body.encoded).to include("/municipes/#{municipe.id}/edit")
    end
  end

  describe 'updated_email' do
    let(:municipe) { create(:municipe) }
    let(:mail) { MunicipeMailer.updated(municipe) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Municipe Atualizado')
      expect(mail.to).to eq([municipe.email])
      expect(mail.from).to eq(['municipes@systems.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include(municipe.full_name)
      expect(mail.body.encoded).to include("Cadastro Atualizado com Sucesso")
      expect(mail.body.encoded).to include("/municipes/#{municipe.id}/edit")
    end
  end
end

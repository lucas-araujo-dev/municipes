# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipeMailer, type: :mailer do
  include ActionView::Helpers::TranslationHelper

  describe 'welcome_email' do
    let(:municipe) { create(:municipe) }
    let(:mail) { described_class.welcome(municipe) }

    it 'renders the headers', :aggregate_failures do
      expect(mail.subject).to eq(t('mailers.municipe_mailer.created'))
      expect(mail.to).to eq([municipe.email])
      expect(mail.from).to eq(['municipes@systems.com'])
    end

    it 'renders the body', :aggregate_failures do
      expect(mail.body.encoded).to include(municipe.full_name)
      expect(mail.body.encoded).to include(t('mailers.municipe_mailer.welcome_message'))
      expect(mail.body.encoded).to include("/municipes/#{municipe.id}/edit")
    end
  end

  describe 'updated_email' do
    let(:municipe) { create(:municipe) }
    let(:mail) { described_class.updated(municipe) }

    it 'renders the headers', :aggregate_failures do
      expect(mail.subject).to eq(t('mailers.municipe_mailer.updated'))
      expect(mail.to).to eq([municipe.email])
      expect(mail.from).to eq(['municipes@systems.com'])
    end

    it 'renders the body', :aggregate_failures do
      expect(mail.body.encoded).to include(municipe.full_name)
      expect(mail.body.encoded).to include(t('mailers.municipe_mailer.updated'))
      expect(mail.body.encoded).to include("/municipes/#{municipe.id}/edit")
    end
  end
end

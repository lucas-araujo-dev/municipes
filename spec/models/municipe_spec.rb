# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipe, type: :model do
  subject(:municipe) { build(:municipe) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:picture) }
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:cns).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:full_name).is_at_most(255) }
    it { is_expected.to validate_length_of(:phone).is_at_most(15) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_cns(:cns) }
    it { is_expected.to require_a_valid_cpf(:cpf) }
    it { is_expected.to allow_value(municipe.email).for(:email) }

    it 'validates birthdate', :aggregate_failures do
      expect(municipe).to be_valid
      municipe.birthdate = 1.day.from_now
      expect(municipe).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_one(:address).dependent(:destroy).inverse_of(:municipe) }
    it { is_expected.to accept_nested_attributes_for(:address) }
    it { is_expected.to have_one_attached(:picture) }
  end
end

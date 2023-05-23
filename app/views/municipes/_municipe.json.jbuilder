# frozen_string_literal: true

json.extract! municipe, :id, :full_name, :cpf, :cns, :email, :birthdate, :phone, :picture, :status, :created_at,
  :updated_at
json.url municipe_url(municipe, format: :json)

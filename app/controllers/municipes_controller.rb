# frozen_string_literal: true

class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[edit update]

  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def edit
    @municipe.build_address unless @municipe.address
  end

  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_url, notice: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipes_url, notice: :updated }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:full_name, :cpf, :cns, :email, :birthdate, :phone, :picture, :status,
      address_attributes: %i[street zipcode complement neighborhood city uf ibge_code])
  end
end

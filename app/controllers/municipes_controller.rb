# frozen_string_literal: true

class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[edit update]

  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
  end

  def edit; end

  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_url(@municipe), notice: :created }
        format.json head :created
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipe_url(@municipe), notice: :updated }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:full_name, :cpf, :cns, :email, :birthdate, :phone, :picture, :status)
  end
end

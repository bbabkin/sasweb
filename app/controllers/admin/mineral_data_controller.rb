class Admin::MineralDataController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @mineraldata = MineralDatum.newest_first
    @headers = Header.all

  end

  def show
    @mineraldatum = MineralDatum.find(params[:id])
  end

  def new
    @mineraldatum = MineralDatum.new()

    @mineraldatum_count = MineralDatum.count + 1
  end

  def create
    @mineraldatum = MineralDatum.new(mineral_data_params)
      if @mineraldatum.save
      flash[:notice] = "Mineral data created successfully."
      redirect_to(:action => 'index')
    else
      @mineraldatum_count = MineralDatum.count + 1
      render('new')
    end
  end

  def edit
    @mineraldatum = MineralDatum.find(params[:id])
    @mineraldatum_count = MineralDatum.count
    @header = Header.find(params[:id])
    @header_count = Header.count
  end

  def update
    @mineraldatum = MineralDatum.find(params[:id])
    if @mineraldatum.update_attributes(mineral_data_params)
      flash[:notice] = "Mineral data updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @mineraldatum_count = MineralDatum.count
      render('edit')
    end

    @header = Header.find(params[:id])
    if @header.update_attributes(header_params)
      flash[:notice] = "Header text updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @header_count = Header.count
      render('edit')
    end


  end

  def delete
    @mineraldatum = MineralDatum.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldnt be here
    @mineraldatum = MineralDatum.find(params[:id]).destroy
    flash[:notice] = "Mineral data removed successfully."
    redirect_to(:action => 'index')
  end


  private

    def mineral_data_params
      params.require(:mineral_datum).permit(:mine_name, :mine_data, :data_type)
    end


end
class Admin::StaffEntriesController < ApplicationController

  layout "admin"
  

  before_action :confirm_logged_in

  def index
    @staffentries = StaffEntry.sorted

  end

  def show
    @staffentry = StaffEntry.find(params[:id])
  end

  def new
    @staffentry = StaffEntry.new()

    @staffentry_count = StaffEntry.count + 1
  end

  def create
    @staffentry = StaffEntry.new(staff_entry_params)
      if @staffentry.save
      flash[:notice] = "Team member created successfully."
      redirect_to(:action => 'index')
    else
      @staffentry_count = StaffEntry.count + 1
      render('new')
    end
  end

  def edit
    @staffentry = StaffEntry.find(params[:id])
    @staffentry_count = StaffEntry.count
  end

  def update
    @staffentry = StaffEntry.find(params[:id])
    if @staffentry.update_attributes(staff_entry_params)
      flash[:notice] = "Team member updated successfully."
      # redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
      redirect_to(:action => 'index')
    else
      @staffentry_count = StaffEntry.count
      render('edit')
    end
  end

  def delete
    @staffentry = StaffEntry.find(params[:id])
  end

  def destroy
    #v-maybe @ shouldnt be here
    @staffentry = StaffEntry.find(params[:id]).destroy
    flash[:notice] = "Team member removed successfully."
    redirect_to(:action => 'index')
  end
  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  private

    def staff_entry_params
      params.require(:staff_entry).permit(
        :name, 
        :position,:section,:summary,:title,
        :is_board_member, :appointed_date,
        :committee1,:committee2,:committee3,:committee4,
        :photo1,:photo2,
        :permalink
        )
    end


end
class ProfilesController < ApplicationController
  before_filter :authenticate

  def new    
    @profile = Profile.new style_type_id: params[:id]
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def create
    @profile = Profile.new params[:profile]
    @profile.style_type_id
    if @profile.save
      redirect_to collections_path, notice: 'Created Profile'
    else
      render :new
    end
  end

  def update
    @profile = Profile.find params[:id]

    if @profile.update_attributes params[:profile]
      redirect_to collections_path, notice: 'Updated Profile'
    else
      render :edit
    end
  end

  def destroy
    profile = Profile.find params[:id]
    profile.destroy
    flash[:error] = "Deleted Profile"
    redirect_to collections_path
  end
end
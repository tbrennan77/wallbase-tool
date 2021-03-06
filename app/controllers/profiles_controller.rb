class ProfilesController < ApplicationController
  before_filter :authenticate

  def new    
    @profile = Profile.new style_type_id: params[:id]
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.style_type_id
    if @profile.save
      redirect_to collection_path(@profile.collection), notice: 'Created Profile'
    else
      render :new
    end
  end

  def update
    @profile = Profile.find params[:id]

    if @profile.update_attributes(profile_params)
      redirect_to collection_path(@profile.collection), notice: 'Updated Profile'
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

  private

  def profile_params
    params.require(:profile).permit(
      :style_type_id,
      :profile_image,
      :corner_image,      
      :size,
      :uuid,
      color_palette_ids: [])
  end
end
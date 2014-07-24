class OpeningPagesController < ApplicationController
  before_filter :authenticate

  def index
    @opening_page = OpeningPage.first
  end

  def update
    @opening_page = OpeningPage.find params[:id]
    @opening_page.update_attributes(opening_page_params)
    redirect_to opening_pages_path, notice: "Updated Opening Page"
  end

  private

  def opening_page_params
    params.require(:opening_page).permit(:body)
  end
end

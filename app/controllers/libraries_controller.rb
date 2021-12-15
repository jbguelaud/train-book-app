class LibrariesController < ApplicationController
   before_action :set_library, only: [:show, :edit, :update, :destroy]

  def index
    @libraries = Library.all
  end

  def show
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(params_library)
    if @library.save
      redirect_to @library
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @library.update(params_library)
      redirect_to @library
    else
      render :edit
    end
  end

  def destroy
    @library.destroy
    redirect_to libraries_path
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def params_library
    params.require(:library).permit(:name, :address)
  end
end

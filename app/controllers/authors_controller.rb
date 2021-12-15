class AuthorsController < ApplicationController
before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params_author)
    if @author.save
      redirect_to @author
    else
    render :new
    end
  end

  def edit
  end

  def update
    if @author.update(params_author)
      redirect_to author_path(@author.id)
    else
    render :edit
    end
  end

  def destroy
  @author.destroy
  redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def params_author
    params.require(:author).permit(:first_name, :last_name)
  end

end

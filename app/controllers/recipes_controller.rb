class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @category = Category.find_by(params[:category_id])
    @recipe = @category.recipes.find_by(params[:recipe_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @recipe = current_user.recipes.new
  end

  
  def edit
    @category = Category.find(params[:category_id])
    @recipe = current_user.recipes.find(params[:id])
  end

  def create
    @category = Category.find_by(params[:category_id])
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.category = @category
    
    if @recipe.save
      redirect_to user_path(current_user)
    else
      @errors = @recipe.errors.full_messages
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:recipe][:category_id])
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      @errors = @recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy

    redirect_to recipe_path(@recipe)
  end

private

  def recipe_params
    params.require(:recipe).permit(:category_id, :name, :description, :difficulty, :prep_time, :directions)
  end
end

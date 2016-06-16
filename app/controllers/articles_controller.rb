class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(params[:article].permit(:title, :text))

		if @article.save
			redirect_to '/articles'
		else
			render 'new'
		end
	end

	def edit 
		@article = Article.find(params[:id])
	end

	def show 
		@article = Article.find(params[:id])
	end


	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end

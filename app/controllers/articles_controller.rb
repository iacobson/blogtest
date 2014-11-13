class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "iacobson", password: "secret", except: [:index, :show]
	#this adds a basic authentification system. Users needs authentification for all actions except index and show.
	#only Iacobson can add and delete articles

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)	#Article model is initialized with its attributes

		if @article.save	#saves the model in the database
			redirect_to @article 	#redirects user to show action
		else
			render 'new' 	#The render method is used so that the @article object is passed back to the new template when it is rendered. 
							#This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.
							#Practically it maintains the initial data from the submission form
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all 	#convention to use plural for more articles
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)	#updates the model in the database
			redirect_to @article
		else
			render 'edit'	#Maintains the initial data from the submission form (instead to redirect_to)
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private		
		def article_params
			params.require(:article).permit(:title, :text)
		end
end

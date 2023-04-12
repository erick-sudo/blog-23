class ArticlesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        render :index
    end

    def create
        @article = Article.new({title: article_params[:title], body: article_params[:body]})
        if @article.save
            if article_params[:avatar]
                @article.avatar.attach(article_params[:avatar])
            end
            if article_params[:posters]
                @article.posters.attach(article_params[:posters])
            end
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :body, :avatar, posters: [])
    end

    def invalid_record_response(invalid)
        render :new, status: :unprocessable_entity
    end
end

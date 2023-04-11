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

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
        else
            pp @article.errors.full_messages
            render :new, status: :unprocessable_entity
        end
        # Article.create!(article_params)
        # redirect_to @article
    end

    private

    def article_params
        params.permit(:title, :body, :images)
    end

    def invalid_record_response(invalid)
        render :new, status: :unprocessable_entity
    end
end

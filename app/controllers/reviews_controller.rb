# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :validate]
  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: [:index]

  def index
    @reviews = policy_scope(Review)
    if params[:status].present?
      @reviews = Review.where(status: params[:status])
    else
      @reviews = Review.all.includes(:archive, :user).order(created_at: :desc)
    end
  end

  def new
    @archive = Archive.find(params[:archive_id])
    @review = @archive.reviews.build
    @review.assign_attributes(
      title: @archive.title,
      subject: @archive.subject,
      description: @archive.description,
      language: @archive.language,
      date: @archive.date,
      ambito_e_conteudo: @archive.ambito_e_conteudo,
      estado_de_ponto_de_acesso: @archive.estado_de_ponto_de_acesso,
      pontos_de_acesso_e_indexacao_de_assuntos: @archive.pontos_de_acesso_e_indexacao_de_assuntos
    )
  end

  # app/controllers/reviews_controller.rb
  def create
    authorize @review
    @archive = Archive.find(params[:archive_id])  # Set @archive here as well
    @review = @archive.reviews.build(review_params)
    @review.user = current_user
    @review.title = @archive.title
    @review.status = 'pending'
    if @review.save
      redirect_to archive_path(@review.archive), notice: 'Review has been submitted successfully.'
    else
      render :new
    end
  end

  def show
    authorize @review
    @archive = @review.archive  # Fetch the associated archive
  end

  def validate
    @archive = @review.archive
    case params[:status]
    when 'approved'
      @review.update(status: 'approved')
      @archive.update(
        title: @review.title,
        subject: @review.subject,
        description: @review.description,
        language: @review.language,
        date: @review.date,
        ambito_e_conteudo: @review.ambito_e_conteudo,
        estado_de_ponto_de_acesso: @review.estado_de_ponto_de_acesso,
        pontos_de_acesso_e_indexacao_de_assuntos: @review.pontos_de_acesso_e_indexacao_de_assuntos
      )
      redirect_to reviews_path, notice: 'Review approved and archive updated.'
    when 'declined'
      @review.update(status: 'declined')
      redirect_to reviews_path, notice: 'Review declined.'
    else
      render :show, alert: 'Invalid operation.'
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :category, :subject, :description, :language, :date, :ambito_e_conteudo, :estado_de_ponto_de_acesso, :pontos_de_acesso_e_indexacao_de_assuntos, :status, :validated)
  end
end

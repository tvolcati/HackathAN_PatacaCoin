# app/controllers/archives_controller.rb
class ArchivesController < ApplicationController
  before_action :set_archive, only: %i[show edit update destroy download review]

  def index
    @archives = policy_scope(Archive)
    @categories = ['Textual', 'Sonoro', 'Iconografico', 'Cartografico', 'Audio-Visual']
    if params[:category].present?
      @archives = Archive.where(category: params[:category])
    else
      @archives = Archive.all
    end
  end

  def show
    authorize @archive
  end

  def new
    @archive = Archive.new
    authorize @archive
  end

  def edit
    authorize @archive
  end

  def review
    authorize @archive
    @review = @archive.reviews.new
    render 'reviews/new'
  end

  def create
    @archive = Archive.new(archive_params)
    authorize @archive
    if @archive.save
      redirect_to @archive, notice: 'Archive was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @archive
    if @archive.update(archive_params)
      redirect_to @archive, notice: 'Archive was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @archive
    @archive.destroy
    redirect_to archives_url, notice: 'Archive was successfully destroyed.'
  end

  def download
    @archive = Archive.find(params[:id])
    send_data(@archive.file.download, filename: @archive.file.filename.to_s)
  end

  private

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def archive_params
    # If creating a new record, only permit the file to be uploaded.
    if action_name == 'create'
      params.require(:archive).permit(:file, :title, :category)
    else
      # For other actions, such as 'update', permit all the other fields.
      params.require(:archive).permit(:title, :category, :subject, :description, :language, :date, :ambito_e_conteudo, :estado_de_ponto_de_acesso, :pontos_de_acesso_e_indexacao_de_assuntos)
    end
  end
end

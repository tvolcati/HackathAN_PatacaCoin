# app/controllers/archives_controller.rb
class ArchivesController < ApplicationController
  before_action :set_archive, only: %i[show edit update destroy download]

  def index
    @archives = Archive.all
  end

  def show; end

  def new
    @archive = Archive.new
  end

  def edit; end

  def create
    @archive = Archive.new(archive_params)

    if @archive.save
      redirect_to @archive, notice: 'Archive was successfully created.'
    else
      render :new
    end
  end

  def update
    if @archive.update(archive_params)
      redirect_to @archive, notice: 'Archive was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @archive.destroy
    redirect_to archives_url, notice: 'Archive was successfully destroyed.'
  end

  def download
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
      params.require(:archive).permit(:identifier, :registration_date, :location, :originator_agent, :recipient_agent, :production_date, :transmission_date, :reception_date, :related_activities, :related_documents, :title, :subject, :description, :coverage, :language, :encoding_format, :media_type, :compression_encryption, :hardware_software_dependencies, :aggregation_level, :extent, :preservation_responsibility, :preservation_action_date, :preservation_activity_type, :preservation_impact, :next_preservation_action, :physical_storage_support, :access_use_history)
    end
  end
end

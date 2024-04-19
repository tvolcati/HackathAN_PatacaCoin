# db/migrate/[timestamp]_refactor_archives_table.rb
class RefactorArchivesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :archives, :identifier
    remove_column :archives, :registration_date
    remove_column :archives, :location
    remove_column :archives, :originator_agent
    remove_column :archives, :recipient_agent
    remove_column :archives, :production_date
    remove_column :archives, :transmission_date
    remove_column :archives, :reception_date
    remove_column :archives, :related_activities
    remove_column :archives, :related_documents
    remove_column :archives, :coverage
    remove_column :archives, :encoding_format
    remove_column :archives, :media_type
    remove_column :archives, :compression_encryption
    remove_column :archives, :hardware_software_dependencies
    remove_column :archives, :aggregation_level
    remove_column :archives, :extent
    remove_column :archives, :preservation_responsibility
    remove_column :archives, :preservation_action_date
    remove_column :archives, :preservation_activity_type
    remove_column :archives, :preservation_impact
    remove_column :archives, :next_preservation_action
    remove_column :archives, :physical_storage_support
    remove_column :archives, :access_use_history
    remove_column :archives, :file

    # Assuming the title, category and other specific fields to be added or kept
    add_column :archives, :date, :date
    add_column :archives, :ambito_e_conteudo, :text
    add_column :archives, :estado_de_ponto_de_acesso, :string
    add_column :archives, :pontos_de_acesso_e_indexacao_de_assuntos, :text
  end
end

class CreateArchives < ActiveRecord::Migration[7.0]
  def change
    create_table :archives do |t|
      t.string :identifier
      t.datetime :registration_date
      t.string :location
      t.string :originator_agent
      t.string :recipient_agent
      t.datetime :production_date
      t.datetime :transmission_date
      t.datetime :reception_date
      t.text :related_activities
      t.text :related_documents
      t.string :title
      t.string :subject
      t.text :description
      t.text :coverage
      t.string :language
      t.string :encoding_format
      t.string :media_type
      t.string :compression_encryption
      t.text :hardware_software_dependencies
      t.string :aggregation_level
      t.string :extent
      t.string :preservation_responsibility
      t.datetime :preservation_action_date
      t.string :preservation_activity_type
      t.text :preservation_impact
      t.text :next_preservation_action
      t.text :physical_storage_support
      t.text :access_use_history
      t.binary :file

      t.timestamps
    end
  end
end

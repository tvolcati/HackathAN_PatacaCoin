# db/migrate/[timestamp]_add_fields_to_reviews.rb
class AddFieldsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :titulo, :text
    add_column :reviews, :data, :date
    add_column :reviews, :ambito_e_conteudo, :text
    add_column :reviews, :estado_de_ponto_de_acesso, :string
    add_column :reviews, :pontos_de_acesso_e_indexacao_de_assuntos, :text
  end
end

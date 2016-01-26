class CreateTablesSurveysQuestionsResponses < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.string :title
      t.timestamps null: false
    end

    create_table(:questions) do |t|
      t.string :question
      t.belongs_to :survey, index: true
      t.timestamps null: false
    end

    create_table(:responses) do |t|
      t.string :response
      t.belongs_to :question, index: true
      t.timestamps null: false
    end
  end
end

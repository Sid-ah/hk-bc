require_relative '../spec_helper'

describe "ratings table" do

  it "ratings table in the database" do
    database_connection = ActiveRecord::Base.connection
    expect(database_connection.table_exists? :ratings).to be_truthy, "Expected the database to have a ratings table"
  end


  expected_column_types_and_names = {
    :integer  => ["id", "coolness", "cuteness", "judge_id", "dog_id"],
    :datetime => ["created_at", "updated_at"]
  }

  begin
    actual_columns = ActiveRecord::Base.connection.columns(:ratings)
  rescue
    actual_columns = []
  end

  expected_column_types_and_names.each do |expected_type, expected_column_names|
    expected_column_names.each do |expected_column_name|
      it "has a #{expected_type} column named #{expected_column_name}" do
        match_criteria = -> (actual_column) { actual_column.type == expected_type && actual_column.name == expected_column_name}
        matching_column = actual_columns.find &match_criteria
        expect(matching_column).to be_truthy, "Did not find a #{expected_type} column named #{expected_column_name} in the ratings table"
      end
    end
  end

  it "no longer has a column named rater_id" do
    actual_column_names = actual_columns.map(&:name)
    expect(actual_column_names).not_to include('rater_id')
  end
end

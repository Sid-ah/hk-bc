require_relative '../spec_helper'

describe "dogs table" do

  it "dogs table in the database" do
    database_connection = ActiveRecord::Base.connection
    expect(database_connection.table_exists? :dogs).to be_truthy, "Expected the database to have a dogs table"
  end


  expected_column_types_and_names = {
    :integer  => ["id", "age", "owner_id", "weight"],
    :string   => ["name", "license"],
    :datetime => ["created_at", "updated_at"]
  }

  begin
    actual_columns = ActiveRecord::Base.connection.columns(:dogs)
  rescue
    actual_columns = []
  end

  expected_column_types_and_names.each do |expected_type, expected_column_names|
    expected_column_names.each do |expected_column_name|
      it "has a #{expected_type} column named #{expected_column_name}" do
        match_criteria = -> (actual_column) { actual_column.type == expected_type && actual_column.name == expected_column_name}
        matching_column = actual_columns.find &match_criteria
        expect(matching_column).to be_truthy, "Did not find a #{expected_type} column named #{expected_column_name} in the dogs table"
      end
    end
  end
end

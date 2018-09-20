require_relative '../spec_helper'

describe 'students table' do
  it 'exists in the database' do
    students_table = ActiveRecord::Base.connection.table_exists?(:students)
    expect(students_table).to be_truthy
  end

  expected_column_types_and_names = {
    :integer  => ['id'],
    :string   => ['first_name', 'last_name', 'phone'],
    :date     => ['birthday'],
    :datetime => ['created_at', 'updated_at']
  }

  begin
    actual_columns = ActiveRecord::Base.connection.columns(:students)
  rescue
    actual_columns = []
  end

  expected_column_types_and_names.each do |expected_type, expected_column_names|
    expected_column_names.each do |expected_column_name|
      it "has a #{expected_type} column named #{expected_column_name}" do
        match_criteria = -> (actual_column) { actual_column.type == expected_type && actual_column.name == expected_column_name}
        matching_column = actual_columns.find &match_criteria
        expect(matching_column).to be_truthy
      end
    end
  end
end

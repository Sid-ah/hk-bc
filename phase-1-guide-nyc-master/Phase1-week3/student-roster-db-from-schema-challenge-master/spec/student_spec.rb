require_relative '../config'
require_relative '../student'

describe Student do
  describe 'object attributes' do
    it 'has a readable and writable first name' do
      student = Student.new('first_name' => 'Jackalyn')
      expect { student.first_name = 'Aminah' }.to change { student.first_name }.from('Jackalyn').to('Aminah')
    end

    it 'has a readable and writable last name' do
      student = Student.new('last_name' => 'Knaggs')
      expect { student.last_name = 'Arthur' }.to change { student.last_name }.from('Knaggs').to('Arthur')
    end

    it 'has a readable and writable gender' do
      student = Student.new('gender' => 'male')
      expect { student.gender = 'female' }.to change { student.gender }.from('male').to('female')
    end

    it 'has a readable and writable birthday' do
      student = Student.new('birthday' => '1781-05-22')
      expect { student.birthday = '1981-05-22' }.to change { student.birthday }.from('1781-05-22').to('1981-05-22')
    end

    it 'has a readable and writable email address' do
      student = Student.new('email' => 'email@address.com')
      expect { student.email = 'email@me.com' }.to change { student.email }.from('email@address.com').to('email@me.com')
    end

    it 'has a readable and writable phone number' do
      student = Student.new('phone' => '419-555-1234')
      expect { student.phone = '419-555-0000' }.to change { student.phone }.from('419-555-1234').to('419-555-0000')
    end
  end

  describe 'persistence' do
    # Start each test with no data in the students table.
    # We'll add any data we need before each specific test.
    before(:each) do
      $db.transaction
      $db.execute('DELETE FROM students')
    end

    # Undo any changes to the database after each test.
    after(:each) do
      $db.rollback
    end

    describe 'attributes related to persistence' do
      it 'has a readable id' do
        student = Student.new('id' => 30)
        expect(student.id).to eq 30
      end

      it 'has a readable created at time' do
        student = Student.new('created_at' => '2015-09-30 16:46:30')
        expect(student.created_at).to eq '2015-09-30 16:46:30'
      end

      it 'has a readable updated at time' do
        student = Student.new('updated_at' => '2015-09-30 16:46:30')
        expect(student.updated_at).to eq '2015-09-30 16:46:30'
      end
    end

    describe 'retrieving data from the database' do
      describe 'returning multiple students' do
        describe '.all' do
          context 'when there are no students in the database' do
            it 'returns an empty collection' do
              expect(Student.all).to be_empty
            end
          end

          context 'when there are students in the database' do

            # Add student records to the database so that we can retrieve them in our tests.
            before(:each) do
              $db.execute(
                <<-SQL_INSERT_STATEMENT
                INSERT INTO students
                  (first_name, last_name, birthday, created_at, updated_at)
                VALUES
                  ('Danielle','Michael', DATETIME('1971-07-04'), DATETIME('now'), DATETIME('now')),
                  ('Tobin','Larue', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
                SQL_INSERT_STATEMENT
              )
            end

            it 'returns a collection of student objects' do
              expect(Student.all).to all(be_an_instance_of(Student))
            end

            it 'returns a collection with all the students in it' do
              count_of_students_in_db = $db.get_first_value('SELECT COUNT(*) FROM students;')

              expect(Student.all.length).to eq count_of_students_in_db
            end
          end
        end

        describe '.where' do
          context 'when there are no students matching the specified conditions in the database' do
            it 'returns an empty collection' do
              expect(Student.where({ first_name: 'John' })).to be_empty
            end
          end

          context 'when there are students matching the specified conditions in the database' do

            # Add student records to the database so that we can retrieve them in our tests.
            before(:each) do
              $db.execute(
                <<-SQL_INSERT_STATEMENT
                INSERT INTO students
                  (first_name, last_name, birthday, created_at, updated_at)
                VALUES
                  ('Danielle','Michael', DATETIME('1971-07-04'), DATETIME('now'), DATETIME('now')),
                  ('John','Smith', DATETIME('1997-03-01'), DATETIME('now'), DATETIME('now')),
                  ('John','Johnson', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
                SQL_INSERT_STATEMENT
              )
            end

            it 'returns a collection of students matching a given condition' do
              count_of_johns_in_db = $db.get_first_value('SELECT COUNT(*) FROM students WHERE first_name = "John";')

              found_johns = Student.where({ first_name: 'John' })
              expect(found_johns.count).to eq count_of_johns_in_db
            end

            it "returns a collection of student objects" do
              found_johns = Student.where({ first_name: 'John' })
              expect(found_johns).to all(be_an_instance_of(Student))
            end
          end
        end

        describe '.all_by_birthday' do
          context 'when there are no students in the database' do
            it 'returns an empty collection' do
              expect(Student.all_by_birthday).to be_empty
            end
          end

          context 'when there are students in the database' do
            # Add student records to the database so that we can retrieve them in our tests.
            before(:each) do
              $db.execute(
                <<-SQL_INSERT_STATEMENT
                INSERT INTO students
                  (first_name, last_name, birthday, created_at, updated_at)
                VALUES
                  ('Danielle','Michael', DATETIME('1971-07-04'), DATETIME('now'), DATETIME('now')),
                  ('Tobin','Larue', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
                SQL_INSERT_STATEMENT
              )
            end

            it 'returns a collection of student objects' do
              expect(Student.all_by_birthday).to all(be_an_instance_of(Student))
            end

            it 'returns a collection with all the students in it' do
              count_of_students_in_db = $db.get_first_value('SELECT COUNT(*) FROM students;')

              expect(Student.all_by_birthday.length).to eq count_of_students_in_db
            end

            it 'orders students by birthday oldest to youngest' do
              name_of_oldest_student = $db.get_first_value('SELECT first_name FROM students ORDER BY birthday asc LIMIT 1;')
              name_of_youngest_student = $db.get_first_value('SELECT first_name FROM students ORDER BY birthday desc LIMIT 1;')

              students_ordered_by_birthday = Student.all_by_birthday

              expect(students_ordered_by_birthday.first.first_name).to eq name_of_oldest_student
              expect(students_ordered_by_birthday.last.first_name).to eq name_of_youngest_student
            end
          end
        end
      end

      describe 'returning a single student' do
        describe '.find' do
          context 'when no record with the given id is in the database' do
            it 'returns nil' do
              expect(Student.find 0).to be_nil
            end
          end

          context 'when a record with the given id is in the database' do
            # Add a student record to the database so that we can find it in our tests.
            before(:each) do
              $db.execute(
                <<-SQL_INSERT_STATEMENT
                INSERT INTO students
                  (first_name, last_name, birthday, created_at, updated_at)
                VALUES
                  ('Tobin','Larue', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
                SQL_INSERT_STATEMENT
              )
            end


            let(:tobin)    { Student.find(tobin_id) }
            let(:tobin_id) { $db.get_first_value('SELECT id FROM students WHERE first_name = "Tobin";') }

            it 'returns a student object' do
              expect(tobin).to be_an_instance_of Student
            end

            it 'returns a student with assigned attributes' do
              expect(tobin.id).to eq tobin_id
              expect(tobin.first_name).to eq 'Tobin'
            end
          end
        end

        describe '.find_by_first_name' do
          context 'when no record with the given first name is in the database' do
            it 'returns nil' do
              expect(Student.find_by_first_name 'Sheena').to be_nil
            end
          end

          context 'when a record with the given first name is in the database' do
            # Add a student record to the database so that we can find it in our tests.
            before(:each) do
              $db.execute(
                <<-SQL_INSERT_STATEMENT
                INSERT INTO students
                  (first_name, last_name, birthday, created_at, updated_at)
                VALUES
                  ('Tobin','Larue', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
                SQL_INSERT_STATEMENT
              )
            end

            it 'returns a student object' do
              tobin = Student.find_by_first_name 'Tobin'
              expect(tobin).to be_an_instance_of Student
            end

            it 'returns a student with the given first name' do
              tobin = Student.find_by_first_name 'Tobin'
              expect(tobin.first_name).to eq 'Tobin'
            end
          end
        end
      end
    end

    describe 'removing data from the database' do
      describe '#delete' do

        # Add a student record to the database so that we have a record to delete.
        before(:each) do
          $db.execute(
            <<-SQL_INSERT_STATEMENT
            INSERT INTO students
              (first_name, last_name, birthday, created_at, updated_at)
            VALUES
              ('Tobin','Larue', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
            SQL_INSERT_STATEMENT
          )
        end

        it 'removes the database record associated with the student from the database' do
          student_count = $db.get_first_value('SELECT COUNT() FROM students')

          student_data = $db.execute('SELECT * FROM students LIMIT 1').first
          student = Student.new(student_data)
          student.delete

          updated_student_count = $db.get_first_value('SELECT COUNT() FROM students')
          expect(updated_student_count).to eq (student_count - 1)
        end
      end
    end

    describe 'writing to the database' do
      describe '#save' do

        let(:mikee_data) do
          { 'first_name' => 'Mikee',
            'last_name'  => 'Pourhadi',
            'gender'     => 'Male',
            'birthday'   => '1985-10-25',
            'email'      => 'mikeepourhadi@gmail.com',
            'phone'      => '630-363-6640' }
        end

        context 'when the student\'s data is not already in the database' do
          let(:unsaved_student) { Student.new(mikee_data) }

          it 'adds a record to the database' do
            student_count = $db.get_first_value('SELECT COUNT() FROM students;')

            unsaved_student.save

            updated_student_count = $db.get_first_value('SELECT COUNT() FROM students')
            expect(updated_student_count).to eq (student_count + 1)
          end

          describe 'assigning the id' do
            it 'has no id before being saved' do
              expect(unsaved_student.id).to be_nil
            end

            it 'is assigned the id generated by the database after save' do
              unsaved_student.save
              expect(unsaved_student.id).to eq $db.last_insert_row_id
            end
          end

          describe 'assigning the created_at time' do
            it 'has no created_at before being saved' do
              expect(unsaved_student.created_at).to be_nil
            end

            it 'is assigned the created_at time generated by the database after save' do
              unsaved_student.save
              created_at_time = $db.get_first_value('SELECT created_at FROM students WHERE id = ? LIMIT 1', $db.last_insert_row_id)

              expect(unsaved_student.created_at).to eq created_at_time
            end

            it 'is formatted like a SQL timestamp' do
              unsaved_student.save
              expect(unsaved_student.created_at).to match /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
            end
          end

          describe 'assigning the updated_at time' do
            it 'has no updated_at before being saved' do
              expect(unsaved_student.updated_at).to be_nil
            end

            it 'is assigned the updated_at time generated by the database after save' do
              unsaved_student.save
              updated_at_time_in_db = $db.get_first_value('SELECT updated_at FROM students WHERE id = ? LIMIT 1;', $db.last_insert_row_id)

              expect(unsaved_student.updated_at).to eq updated_at_time_in_db
            end

            it 'is formatted like a SQL timestamp' do
              unsaved_student.save
              expect(unsaved_student.updated_at).to match /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
            end
          end
        end

        context 'when the student\'s data is already in the database' do

          # Add a student record to the database so that we can update it in our tests.
          before(:each) do
            $db.execute(
              <<-SQL_INSERT_STATEMENT
              INSERT INTO students
                (first_name, last_name, birthday, created_at, updated_at)
              VALUES
                ('Renee','Holland', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
              SQL_INSERT_STATEMENT
            )

            # Allow one second to pass to ensure that we aren't
            # updating during the same second that the record was created.
            sleep(1)
          end

          let(:renee_data) { $db.execute('SELECT * FROM students WHERE first_name = ? AND last_name = ?', 'Renee', 'Holland').first }
          let(:renee) { Student.new(renee_data) }
          let(:renee_id) { renee.id }

          it 'updates the database with new attributes values' do
            renees_last_name_in_db = $db.get_first_value('SELECT last_name FROM students WHERE id = ?', renee_id)
            expect(renees_last_name_in_db).to eq 'Holland'

            # Change the last_name attribute in the Ruby object
            renee.last_name = 'Zeeland'
            renee.save

            renees_new_last_name_in_db = $db.get_first_value('SELECT last_name FROM students WHERE id = ?', renee_id)
            expect(renees_new_last_name_in_db).to eq 'Zeeland'
          end

          describe 'updating the updated_at time' do
            it 'updates the updated_at time in the database' do
              renees_updated_at_time_in_db = $db.get_first_value('SELECT updated_at FROM students WHERE id = ?', renee_id)
              renee.save
              renees_new_updated_at_time_in_db = $db.get_first_value('SELECT updated_at FROM students WHERE id = ?', renee_id)

              expect(renees_new_updated_at_time_in_db).to_not eq renees_updated_at_time_in_db
            end

            it 'updates the updated_at time of the Ruby object' do
              expect { renee.save }.to change { renee.updated_at }
            end
          end
        end
      end
    end
  end
end

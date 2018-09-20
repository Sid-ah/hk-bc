require_relative '../spec_helper'

describe Student do
  describe 'attributes' do
    let(:student) { Student.new(first_name: 'Tad', last_name: 'Hall', birthday: Date.new(1991, 04, 18), phone: '419-555-4938') }

    it 'has a readable and writable first name' do
      expect(student.first_name).to eq 'Tad'
      student.first_name = 'Drake'
      expect(student.first_name).to eq 'Drake'
    end

    it 'has a readable and writable last_name' do
      expect(student.last_name).to eq 'Hall'
      student.last_name = 'Zilberschlag'
      expect(student.last_name).to eq 'Zilberschlag'
    end

    it 'has a readable and writable birthday' do
      expect(student.birthday).to eq Date.new(1991, 04, 18)
      student.birthday = Date.new(1993, 04, 20)
      expect(student.birthday).to eq Date.new(1993, 04, 20)
    end

    it 'has a readable and writable phone number' do
      expect(student.phone).to eq '419-555-4938'
      student.phone = '419-555-3981'
      expect(student.phone).to eq '419-555-3981'
    end

    context 'before being saved' do
      it 'has no id' do
        expect(student.id).to be_nil
      end

      it 'has no created_at timestamp' do
        expect(student.created_at).to be_nil
      end

      it 'has no updated_at timestamp' do
        expect(student.updated_at).to be_nil
      end
    end

    context 'after being saved' do
      before(:each) { student.save }

      it 'has an id' do
        expect(student.id).to_not be_nil
      end

      it 'has a created_at timestamp' do
        expect(student.created_at).to_not be_nil
      end

      it 'has an updated_at timestamp' do
        expect(student.updated_at).to_not be_nil
      end
    end

    describe 'virtual attributes' do
      describe '#full_name' do
        it 'concatenates the first name and the last name' do
          expect(student.full_name).to eq 'Tad Hall'
        end
      end

      describe '#full_name=' do
        context 'a first and last name given' do
          it 'sets the first name and last name' do
            student.full_name = 'Thamir Selby'
            expect(student.first_name).to eq 'Thamir'
            expect(student.last_name).to eq 'Selby'
          end
        end

        context 'a first, middle, and last name given' do
          it 'includes the middle name in the first name' do
            student.full_name = 'Philipa Kriemhilde Fay'
            expect(student.first_name).to eq 'Philipa Kriemhilde'
            expect(student.last_name).to eq 'Fay'
          end
        end
      end

      describe '#age' do
        let(:ten_years_ago) { Date.today - 10.years }
        let(:ten_years_and_one_day_ago) { ten_years_ago - 1.day }
        let(:one_day_shy_of_ten_years_ago) { ten_years_ago + 1.day }

        context 'has birthday today' do
          it 'correctly calculates the student\'s age' do
            student = Student.new(birthday: ten_years_ago)
            expect(student.age).to eq 10
          end
        end

        context 'had a birthday yesterday' do
          it 'correctly calculates the student\'s age' do
            student = Student.new(birthday: ten_years_and_one_day_ago)
            expect(student.age).to eq 10
          end
        end

        context 'has a birthday tomorrow' do
          it 'correctly calculates the students age' do
            student = Student.new(birthday: one_day_shy_of_ten_years_ago)
            expect(student.age).to eq 9
          end
        end
      end
    end
  end


  describe 'validations' do
    let(:student) { Student.new(first_name: 'Shayla', last_name: 'Messerli', birthday: Date.new(1980, 02, 01), phone: '419-555-0987') }

    it 'accepts valid info' do
      expect(student).to be_valid
    end

    it 'is invalid without a first_name' do
      student = Student.new(last_name: 'Dane', birthday: Date.new(1980, 02, 01), phone: '419-555-0987')
      expect(student).to be_invalid
    end

    it 'is invalid without a last_name' do
      student = Student.new(first_name: 'Dollie', birthday: Date.new(1980, 02, 01), phone: '419-555-0987')
      expect(student).to be_invalid
    end

    it 'is invalid without a birthday' do
      student = Student.new(first_name: 'Andile', last_name: 'Sachs', phone: '419-555-0987')
      expect(student).to be_invalid
    end

    it 'is invalid without a phone number' do
      student = Student.new(first_name: 'Ryker', last_name: 'Rowe', birthday: Date.new(1980, 02, 01))
      expect(student).to be_invalid
    end

    describe 'a valid age' do
      let(:five_years_ago) { Date.today - 5.years }
      let(:six_years_ago) { Date.today - 6.years }
      let(:less_than_five_years_ago) { five_years_ago + 1.day }

      it 'exactly five-years-old is valid' do
        student.birthday = five_years_ago
        expect(student).to be_valid
      end

      it 'more than five-years-old is valid' do
        student.birthday = six_years_ago
        expect(student).to be_valid
      end

      it 'less than five-years-old is invalid' do
        student.birthday = less_than_five_years_ago
        expect(student).to be_invalid
      end
    end

    describe "a valid phone number" do
      context 'phone number contains only digits' do
        it 'is valid with ten digits' do
          student.phone = '1234567890'
          expect(student).to be_valid
        end

        it 'is valid with more than ten digits' do
          student.phone = '123456789123456789'
          expect(student).to be_valid
        end

        it 'is invalid with less than ten digits' do
          student.phone = '123456789'
          expect(student).to be_invalid
        end
      end

      context 'phone number contains not-digit characters' do
        it 'is valid with ten digits' do
          student.phone = '123-456-7890'
          expect(student).to be_valid
        end

        it 'is invalid with ten characters but less than ten digits' do
          student.phone = '-123456789'
          expect(student).to be_invalid
        end
      end
    end
  end
end

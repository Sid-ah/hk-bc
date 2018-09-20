require_relative "../student"

describe Student do
  let(:student_data) do
    { :first_name => "Jackalyn",
      :last_name  => "Knaggs",
      :gender     => "male",
      :birthday   => "1781-05-22",
      :email      => "email@address.com",
      :phone      => "419-555-1234" }
  end

  let(:student) { Student.new(student_data) }

  it 'has a readable and writable first name' do
    expect { student.first_name = 'Aminah' }.to change { student.first_name }.from('Jackalyn').to('Aminah')
  end

  it 'has a readable and writable last name' do
    expect { student.last_name = 'Arthur' }.to change { student.last_name }.from('Knaggs').to('Arthur')
  end

  it 'has a readable and writable gender' do
    expect { student.gender = 'female' }.to change { student.gender }.from('male').to('female')
  end

  it 'has a readable and writable birthday' do
    expect { student.birthday = '1981-05-22' }.to change { student.birthday }.from(Date.new(1781, 05, 22)).to(Date.new(1981, 05, 22))
  end

  it 'has a readable and writable email address' do
    expect { student.email = 'email@me.com' }.to change { student.email }.from('email@address.com').to('email@me.com')
  end

  it 'has a readable and writable phone number' do
    expect { student.phone = '419-555-0000' }.to change { student.phone }.from('419-555-1234').to('419-555-0000')
  end
end

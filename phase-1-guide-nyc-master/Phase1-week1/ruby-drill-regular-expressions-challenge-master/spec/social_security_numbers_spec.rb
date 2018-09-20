require_relative('../social_security_numbers')

describe 'has_ssn?' do
  it 'returns true if it finds an SSN' do
    expect(has_ssn?('The number is 234-60-1422')).to be true
  end

  it 'returns false if it does not find an SSN' do
    expect(has_ssn?('The number is XXX-XX-1422')).to be false
  end
end

describe 'grab_ssn' do
  it 'returns an SSN if it finds an SSN' do
    ssn = grab_ssn('The number is 234-60-1422')
    expect(ssn).to eq '234-60-1422'
  end

  it 'returns the first SSN it finds' do
    ssn = grab_ssn('The numbers are 350-80-0744, 234-60-1422, and 013-60-8762')
    expect(ssn).to eq '350-80-0744'
  end

  it 'returns an empty string if it does not find an SSN' do
    ssn = grab_ssn('The number is XXX-XX-1422')
    expect(ssn).to eq String.new('')
  end
end

describe 'grab_all_ssns' do
  it 'returns a collection of all the SSNs if it finds any SSNs' do
    all_ssns = grab_all_ssns('The numbers are 350-80-0744, 234-60-1422, and 013-60-8762')
    expect(all_ssns).to match_array ['350-80-0744', '234-60-1422', '013-60-8762']
  end

  it 'returns an empty collection if does not find any SSNs' do
    all_ssns = grab_all_ssns('The number is XXX-XX-1422')
    expect(all_ssns).to be_empty
  end
end

describe 'hide_all_ssns' do
  it 'obfuscates any SSNs it finds' do
    hidden_ssns = hide_all_ssns('The numbers are 350-80-0744, 234-60-1422, and 013-60-8762')
    expect(hidden_ssns).to eq 'The numbers are XXX-XX-0744, XXX-XX-1422, and XXX-XX-8762'
  end

  it 'returns its input if it finds no SSNs' do
    input = 'The number is XXX-XX-1422'
    expect(hide_all_ssns(input)).to eq input
  end
end

describe 'format_ssns' do
  it 'formats any SSNs it finds' do
    formatted_ssns = format_ssns('The numbers are 350800744, 234.60.1422, and 013--60--8762')
    expect(formatted_ssns).to eq 'The numbers are 350-80-0744, 234-60-1422, and 013-60-8762'
  end

  it 'returns its input if it finds no SSNs' do
    input = 'The number is XXX-XX-1422'
    expect(format_ssns(input)).to eq input
  end
end

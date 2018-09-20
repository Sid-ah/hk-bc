require_relative "../employee"

describe Employee do
  let(:employee) { Employee.new("Elle Gilbert", "Chief Executive Officer", 42) }

  it "has a readable name" do
    expect(employee.name).to eq("Elle Gilbert")
  end

  it "has a writable name" do
    expect { employee.name = "Brittny Gilbert" }.to change { employee.name }.to "Brittny Gilbert"
  end
end

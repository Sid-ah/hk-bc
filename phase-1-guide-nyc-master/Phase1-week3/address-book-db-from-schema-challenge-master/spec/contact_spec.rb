require_relative "../config"
require_relative "../contact"
require_relative "../group"

describe Contact do
  describe "belonging to a group" do
    before(:each) do
      $db.execute(
        <<-SQL_INSERT_STATEMENT
        INSERT INTO groups
          (name, created_at, updated_at)
        VALUES
          ("Nighthawks", DATETIME("now"), DATETIME("now"))
        SQL_INSERT_STATEMENT
      )
    end

    it "returns the group with the id matching its group_id" do
      group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

      contact = Contact.new("name" => "Erik")
      expect(contact.group).to be_nil

      contact.group_id = group.id
      expect(contact.group).to eq group
    end

    describe "assigning a group" do
      it "updates the contact's group_id to match the id of the assigned group" do
        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

        contact = Contact.new("name" => "Jaimin")
        expect(contact.group_id).to be_nil

        contact.group = group
        expect(contact.group_id).to eq group.id
      end

      it "makes the assigned group the contact's group" do
        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

        contact = Contact.new("name" => "Fabi")
        expect(contact.group).to be_nil

        contact.group = group
        expect(contact.group).to eq group
      end
    end
  end

  it "has a readable and writeable name" do
    contact = Contact.new("name" => "Daniel")
    expect(contact.name).to eq "Daniel"
    contact.name = "Ben"
    expect(contact.name).to eq "Ben"
  end

  it "has a readable and writeable phone number" do
    contact = Contact.new("phone" => "419-555-1928")
    expect(contact.phone).to eq "419-555-1928"
    contact.phone = "419-555-3948"
    expect(contact.phone).to eq "419-555-3948"
  end

  it "has a readabel and writeable email address" do
    contact = Contact.new("email" => "casey@gmail.com")
    expect(contact.email).to eq "casey@gmail.com"
    contact.email = "annie@gmail.com"
    expect(contact.email).to eq "annie@gmail.com"
  end

  it "has a readabel and writeable group_id" do
    contact = Contact.new("group_id" => 1)
    expect(contact.group_id).to eq 1
    contact.group_id = 2
    expect(contact.group_id).to eq 2
  end

  it "has a readable id" do
    contact = Contact.new("id" => 1)
    expect(contact.id).to eq 1
  end

  it "has a readable created_at time" do
    contact = Contact.new("created_at" => "2016-06-06")
    expect(contact.created_at).to eq Date.parse("2016-06-06")
  end

  it "has a readable updated_at time" do
    contact = Contact.new("updated_at" => "2016-06-07")
    expect(contact.updated_at).to eq Date.parse("2016-06-07")
  end

  describe "being equal to other objects" do
    it "is equal to itself" do
      contact = Contact.new

      expect(contact).to eq contact
    end

    it "is equal to other contacts with the same id" do
      contact = Contact.new("id" => 1)
      other_contact = Contact.new("id" => 1)

      expect(contact).to eq other_contact
    end

    it "is equal only when persisted" do
      contact = Contact.new
      other_contact = Contact.new

      expect(contact).to_not eq other_contact
    end

    it "is not equal to objects of other types" do
      contact = Contact.new("id" => 1)
      other_object = double("not a contact", id: 1)

      expect(contact).to_not eq other_object
    end
  end

  describe "interacting with the database" do
    describe "retrieving records from the database" do
      before(:each) do
        $db.execute(
          <<-SQL_INSERT_STATEMENT
          INSERT INTO contacts
            (name, phone, email, created_at, updated_at)
          VALUES
            ("Andrew", "419-555-1234", "andrew@gmail.com", DATETIME("now"), DATETIME("now")),
            ("Jared", "419-555-9876", "jared@gmail.com", DATETIME("now"), DATETIME("now")),
            ("Beth", "419-555-9876", "beth@gmail.com", DATETIME("now"), DATETIME("now"));
          SQL_INSERT_STATEMENT
        )
      end

      it "counts the number of records in the database" do
        number_of_contacts_in_db = $db.get_first_value('SELECT COUNT(*) FROM contacts;')
        expect(Contact.count).to equal number_of_contacts_in_db
      end

      it "selects all the contacts in the database" do
        number_of_contacts_in_db = $db.get_first_value('SELECT COUNT(*) FROM contacts;')
        expect(Contact.all.count).to equal number_of_contacts_in_db
      end

      it "selects all the contacts matching given conditions" do
        number_of_contacts_named_jared = $db.get_first_value("SELECT COUNT(*) FROM contacts WHERE name = 'Jared';")
        expect(Contact.where(name: "Jared").count).to eq number_of_contacts_named_jared
      end

      it "selects a single record by id" do
        andrew_id = $db.get_first_value("SELECT id FROM contacts WHERE name = 'Andrew';")
        contact = Contact.find(andrew_id)
        expect(contact.name).to eq "Andrew"
      end

      it "returns nothing if it can't find a record by id" do
        expect(Contact.find(0)).to be_nil
      end
    end

    describe "removing data from the database" do
      before(:each) do
        $db.execute(
          <<-SQL_INSERT_STATEMENT
          INSERT INTO contacts
            (name, phone, email, created_at, updated_at)
          VALUES
            ("Caroline", "419-555-1234", "caroline@gmail.com", DATETIME("now"), DATETIME("now"))
          SQL_INSERT_STATEMENT
        )
      end

      it "removes the record associated with the contact from the database" do
        count_of_contacts = $db.get_first_value("SELECT COUNT() FROM contacts;")

        contact = Contact.new($db.execute('SELECT * FROM contacts LIMIT 1').first)
        contact.destroy

        updated_count_of_contacts = $db.get_first_value("SELECT COUNT() FROM contacts;")
        expect(updated_count_of_contacts).to eq (count_of_contacts - 1)
      end
    end

    describe "writing to the database" do
      context "when the contact has not been persisted" do
        it "inserts a new record into the database" do
          count_of_contacts = $db.get_first_value("SELECT COUNT() FROM contacts;")

          contact = Contact.new("name" => "Sasha")
          contact.save

          updated_count_of_contacts = $db.get_first_value("SELECT COUNT() FROM contacts;")
          expect(updated_count_of_contacts).to eq (count_of_contacts + 1)
        end

        it "updates the contact with the id from the database" do
          contact = Contact.new("name" => "Dusty")
          contact.save

          expect(contact.id).to eq $db.last_insert_row_id
        end

        it "updates the contact with the created_at time from the database" do
          contact = Contact.new("name" => "Tom")
          contact.save

          expected_created_at = DateTime.parse($db.get_first_value("SELECT created_at FROM contacts WHERE id = ? LIMIT 1", $db.last_insert_row_id))
          expect(contact.created_at).to eq expected_created_at
        end

        it "updates the contact with the updated_at time from the database" do
          contact = Contact.new("name" => "Parth")
          contact.save

          expected_updated_at = DateTime.parse($db.get_first_value("SELECT updated_at FROM contacts WHERE id = ? LIMIT 1", $db.last_insert_row_id))
          expect(contact.updated_at).to eq expected_updated_at
        end
      end

      context "when the contact has already been persisted" do
        before(:each) do
          $db.execute(
            <<-SQL_INSERT_STATEMENT
            INSERT INTO contacts
              (name, phone, email, created_at, updated_at)
            VALUES
              ("Paige", "419-555-1234", "paige@gmail.com", DATETIME("now"), DATETIME("now"))
            SQL_INSERT_STATEMENT
          )
        end

        it "updates changed attributes in the database" do
          contact = Contact.new($db.execute("SELECT * FROM contacts LIMIT 1").first)

          contact_name_in_db = $db.get_first_value("SELECT name FROM contacts WHERE id = ?", contact.id)
          expect(contact_name_in_db).to eq "Paige"

          contact.name = "Ariel"
          contact.save

          updated_contact_name_in_db = $db.get_first_value("SELECT name FROM contacts WHERE id = ?", contact.id)
          expect(updated_contact_name_in_db).to eq "Ariel"
        end

        it "updates the updated_at time in the database" do
          sleep(1)
          contact = Contact.new($db.execute("SELECT * FROM contacts LIMIT 1").first)
          original_updated_at_in_db = $db.get_first_value("SELECT updated_at FROM contacts WHERE id = ?", contact.id)

          contact.name = "Nate"
          contact.save

          updated_updated_at_in_db = $db.get_first_value("SELECT updated_at FROM contacts WHERE id = ?", contact.id)
          expect(updated_updated_at_in_db).to_not eq original_updated_at_in_db
        end

        it "updates the contact with the updated_at time from the database" do
          sleep(1)
          contact = Contact.new($db.execute("SELECT * FROM contacts LIMIT 1").first)
          contact.name = "Oliver"
          contact.save

          expected_updated_at = DateTime.parse($db.get_first_value("SELECT updated_at FROM contacts WHERE id = ?", contact.id))
          expect(contact.updated_at).to eq expected_updated_at
        end
      end
    end

    before(:each) do
      # Start each test with no data in the tables.
      # We'll add any data we need before each specific test.
      $db.transaction
      $db.execute("DELETE FROM contacts")
      $db.execute("DELETE FROM contacts")
    end

    # Undo any changes to the database after each test.
    after(:each) do
      $db.rollback
    end
  end
end


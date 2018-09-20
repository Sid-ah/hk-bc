require_relative "../config"
require_relative "../group"
require_relative "../contact"

describe Group do
  describe "having many contacts" do
    before(:each) do
      $db.execute(
        <<-SQL_INSERT_STATEMENT
        INSERT INTO groups
          (name, created_at, updated_at)
        VALUES
          ("Nighthawks", DATETIME("now"), DATETIME("now"))
        SQL_INSERT_STATEMENT
      )

      $db.execute(
        <<-SQL_INSERT_STATEMENT
        INSERT INTO contacts
          (name, group_id, created_at, updated_at)
        VALUES
          ("Mohammad", #{ $db.get_first_value("SELECT id FROM groups LIMIT 1;") }, DATETIME("now"), DATETIME("now"))
        SQL_INSERT_STATEMENT
      )
    end

    it "returns a collection of contacts with its id as the group_id" do
      contact = Contact.new($db.execute("SELECT * FROM contacts LIMIT 1;").first)

      group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)
      expect(group.contacts).to match_array [contact]
    end

    describe "adding a contact" do
      it "updates the contact's group_id to its id" do
        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

        new_contact = Contact.new("name" => "Casey")

        expect(new_contact.group_id).to_not eq group.id
        group.add_contact(new_contact)
        expect(new_contact.group_id).to eq group.id
      end

      it "adds the contact to its collection of contacts" do
        contact = Contact.new($db.execute("SELECT * FROM contacts LIMIT 1;").first)

        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)
        expect(group.contacts).to match_array [contact]

        new_contact = Contact.new("name" => "Casey")

        group.add_contact(new_contact)
        expect(group.contacts).to match_array [contact, new_contact]
      end
    end

    describe "assigning a collection of contacts" do
      it "breaks the association with any previous contacts" do
        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

        old_contact_ids = group.contacts.map(&:id)
        group.contacts = []

        old_contact_ids.each do |id|
          expect(Contact.find(id).group).to be_nil
        end
      end

      it "updates the group_id of each contact in the collection" do
        contact = Contact.new($db.execute("SELECT * FROM contacts LIMIT 1;").first)
        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

        contact_1 = Contact.new("name" => "Raza")
        contact_2 = Contact.new("name" => "Justin")

        group.contacts = [contact_1, contact_2]

        expect(contact_1.group_id).to eq group.id
        expect(contact_2.group_id).to eq group.id
      end

      it "makes the contacts in the collection its contacts" do
        group = Group.new($db.execute("SELECT * FROM groups LIMIT 1;").first)

        contact_1 = Contact.new("name" => "Raza")
        contact_2 = Contact.new("name" => "Justin")

        group.contacts = [contact_1, contact_2]

        expect(group.contacts).to match_array [contact_1, contact_2]
      end
    end
  end

  it "has a readable and writeable name" do
    group = Group.new("name" => "Otters")
    expect(group.name).to eq "Otters"
    group.name = "Nighthawks"
    expect(group.name).to eq "Nighthawks"
  end

  it "has a readable id" do
    group = Group.new("id" => 1)
    expect(group.id).to eq 1
  end

  it "has a readable created_at time" do
    group = Group.new("created_at" => "2016-06-06")
    expect(group.created_at).to eq Date.parse("2016-06-06")
  end

  it "has a readable updated_at time" do
    group = Group.new("updated_at" => "2016-06-07")
    expect(group.updated_at).to eq Date.parse("2016-06-07")
  end

  describe "being equal to other objects" do
    it "is equal to itself" do
      group = Group.new

      expect(group).to eq group
    end

    it "is equal to other groups with the same id" do
      group = Group.new("id" => 1)
      other_group = Group.new("id" => 1)

      expect(group).to eq other_group
    end

    it "is equal only when persisted" do
      group = Group.new
      other_group = Group.new

      expect(group).to_not eq other_group
    end

    it "is not equal to objects of other types" do
      group = Group.new("id" => 1)
      other_object = double("not a group", id: 1)

      expect(group).to_not eq other_object
    end
  end

  describe "interacting with the database" do
    describe "retrieving records from the database" do
      before(:each) do
        $db.execute(
          <<-SQL_INSERT_STATEMENT
          INSERT INTO groups
            (name, created_at, updated_at)
          VALUES
            ("Otters", DATETIME("now"), DATETIME("now")),
            ("Nighthawks", DATETIME("now"), DATETIME("now"));
          SQL_INSERT_STATEMENT
        )
      end

      it "counts the number of records in the database" do
        number_of_groups_in_db = $db.get_first_value('SELECT COUNT(*) FROM groups;')
        expect(Group.count).to equal number_of_groups_in_db
      end

      it "selects all the groups in the database" do
        number_of_groups_in_db = $db.get_first_value('SELECT COUNT(*) FROM groups;')
        expect(Group.all.count).to equal number_of_groups_in_db
      end

      it "selects all the groups matching given conditions" do
        number_of_groups_named_nighthawks = $db.get_first_value("SELECT COUNT(*) FROM groups WHERE name = 'Nighthawks';")
        expect(Group.where(name: "Nighthawks").count).to eq number_of_groups_named_nighthawks
      end

      it "selects a single record by id" do
        nighthawks_id = $db.get_first_value("SELECT id FROM groups WHERE name = 'Nighthawks';")
        group = Group.find(nighthawks_id)
        expect(group.name).to eq "Nighthawks"
      end

      it "returns nothing if it can't find a record by id" do
        expect(Group.find(0)).to be_nil
      end
    end

    describe "removing data from the database" do
      before(:each) do
        $db.execute(
          <<-SQL_INSERT_STATEMENT
          INSERT INTO groups
            (name, created_at, updated_at)
          VALUES
            ("Otters", DATETIME("now"), DATETIME("now"))
          SQL_INSERT_STATEMENT
        )
      end

      it "removes the record associated with the group from the database" do
        count_of_groups = $db.get_first_value("SELECT COUNT() FROM groups;")

        group = Group.new($db.execute('SELECT * FROM groups LIMIT 1').first)
        group.destroy

        updated_count_of_groups = $db.get_first_value("SELECT COUNT() FROM groups;")
        expect(updated_count_of_groups).to eq (count_of_groups - 1)
      end
    end

    describe "writing to the database" do
      context "when the group has not been persisted" do
        it "inserts a new record into the database" do
          count_of_groups = $db.get_first_value("SELECT COUNT() FROM groups;")

          group = Group.new("name" => "Nighthawks")
          group.save

          updated_count_of_groups = $db.get_first_value("SELECT COUNT() FROM groups;")
          expect(updated_count_of_groups).to eq (count_of_groups + 1)
        end

        it "updates the group with the id from the database" do
          group = Group.new("name" => "Nighthawks")
          group.save

          expect(group.id).to eq $db.last_insert_row_id
        end

        it "updates the group with the created_at time from the database" do
          group = Group.new("name" => "Nighthawks")
          group.save

          expected_created_at = DateTime.parse($db.get_first_value("SELECT created_at FROM groups WHERE id = ? LIMIT 1", $db.last_insert_row_id))
          expect(group.created_at).to eq expected_created_at
        end

        it "updates the group with the updated_at time from the database" do
          group = Group.new("name" => "Nighthawks")
          group.save

          expected_updated_at = DateTime.parse($db.get_first_value("SELECT updated_at FROM groups WHERE id = ? LIMIT 1", $db.last_insert_row_id))
          expect(group.updated_at).to eq expected_updated_at
        end
      end

      context "when the group has already been persisted" do
        before(:each) do
          $db.execute(
            <<-SQL_INSERT_STATEMENT
            INSERT INTO groups
              (name, created_at, updated_at)
            VALUES
              ("Otters", DATETIME("now"), DATETIME("now"))
            SQL_INSERT_STATEMENT
          )
        end

        it "updates changed attributes in the database" do
          group = Group.new($db.execute("SELECT * FROM groups LIMIT 1").first)

          group_name_in_db = $db.get_first_value("SELECT name FROM groups WHERE id = ?", group.id)
          expect(group_name_in_db).to eq "Otters"

          group.name = "Nighthawks"
          group.save

          updated_group_name_in_db = $db.get_first_value("SELECT name FROM groups WHERE id = ?", group.id)
          expect(updated_group_name_in_db).to eq "Nighthawks"
        end

        it "updates the updated_at time in the database" do
          sleep(1)
          group = Group.new($db.execute("SELECT * FROM groups LIMIT 1").first)
          original_updated_at_in_db = $db.get_first_value("SELECT updated_at FROM groups WHERE id = ?", group.id)

          group.name = "Nighthawks"
          group.save

          updated_updated_at_in_db = $db.get_first_value("SELECT updated_at FROM groups WHERE id = ?", group.id)
          expect(updated_updated_at_in_db).to_not eq original_updated_at_in_db
        end

        it "updates the group with the updated_at time from the database" do
          sleep(1)
          group = Group.new($db.execute("SELECT * FROM groups LIMIT 1").first)
          group.name = "Nighthawks"
          group.save

          expected_updated_at = DateTime.parse($db.get_first_value("SELECT updated_at FROM groups WHERE id = ?", group.id))
          expect(group.updated_at).to eq expected_updated_at
        end
      end
    end
  end

  before(:each) do
    # Start each test with no data in the tables.
    # We'll add any data we need before each specific test.
    $db.transaction
    $db.execute("DELETE FROM groups")
    $db.execute("DELETE FROM contacts")
  end

  # Undo any changes to the database after each test.
  after(:each) do
    $db.rollback
  end
end


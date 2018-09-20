#
# Running this file from the command line
# will delete the file "database.db" if it exists.
# A new database file will be created.
#
# This file should only be run at the beginning of the challenge
# or if anything goes wrong and we need to reset the database.
#


# Delete the existing database
require "fileutils"
FileUtils.remove_file("./database.db") rescue nil


# Create a fresh database
require_relative 'config'

$db.execute(
  <<-CREATE_GROUPS_TABLE
  CREATE TABLE groups (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       VARCHAR(32) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
  );
  CREATE_GROUPS_TABLE
)

$db.execute(
  <<-CREATE_CONTACTS_TABLE
  CREATE TABLE contacts (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       VARCHAR(64) NOT NULL,
    phone      VARCHAR(32),
    email      VARCHAR(64),
    group_id   INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
  );
  CREATE_CONTACTS_TABLE
)


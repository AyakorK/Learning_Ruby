# !/usr/bin/env ruby
# Purpose : Write a script where asks for a confirmation when deleting a folder if this folder contains a file .important
# If the user confirms the deletion, the folder is deleted.
# If the user cancels the deletion, the folder is not deleted.
# Author: Guillaume MORET
# ------------------------------------------------------------------------------

# require class folder.rb
require 'byebug'
require_relative 'folder.rb'


Folder.delete_folder("../file_test2")






# frozen_string_literal: true

# !/usr/bin/env ruby
# Purpose : Write a script where asks for a confirmation when deleting a folder if it contains a file .important
# If the user confirms the deletion, the folder is deleted.
# If the user cancels the deletion, the folder is not deleted.
# Author: Guillaume MORET
# ------------------------------------------------------------------------------

require 'byebug'
require_relative 'folder'

Folder.delete_folder(ARGV[1])

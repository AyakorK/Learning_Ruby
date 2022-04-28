require 'fileutils'

class Folder
  def self.delete_folder(folder = nil)
    #puts folder + ' this folder'
    # Search the actual folder in our folders
    folders = Dir.entries(folder)
    #puts folders
    # if folder contains file .important ask for a confirmation before deleting it
    # Verify if this folder exists
    answer = ""
    if folders.include? '.important'
      while answer != 'y' && answer != 'n' && answer != 'Y' && answer != 'N' do
        puts 'This folder contains a .important file, do you want to delete it? (y/n)'
        answer = gets.chomp
        if answer == 'y' || answer == 'Y'
          puts 'Deleting folder'
          FileUtils.rm_rf(folder)
        else if answer == 'n' || answer == 'N'
          puts 'Aborting'
        end
        end
      end
    else
      puts 'Deleting folder'
      FileUtils.rm_rf(folder)
    end
  end
end
require 'fileutils'

class Folder

  def self.check_folder(folder)

    return false if !File.directory?(folder)

    folders = Dir.entries(folder)

    return true if check_important(folders)
      return true
    end

    folders.each do |f|
      next if f.include?(".")
      if File.directory?("#{folder}/#{f}")
        subfolder= "#{folder}/#{f}"
        puts "Found subfolder: #{subfolder}"
        puts "Found subfolder: " + subfolder
        return true if check_folder(subfolder)
      end
    end
  end

  def self.check_important(folders)
    #puts "Checking important files in folder: " + folders.to_s
    return false unless folders.include?(".important")
    
    puts "Found '.important' file"
    true
      puts "Found .important file"
      return true
    end
  end

  def self.ask_answer(question)
    puts question
    return gets.chomp
  end


  def self.delete_folder(folder = null)

    if !File.directory?(folder)
      puts "Folder does not exist"
      return
    end

    if check_folder(folder).inspect == "true"
      question = "This folder #{folder} contains a .important file, do you want to delete it? (y/n)"
      answer = ask_answer(question)
      while answer != 'y' && answer != 'n' && answer != 'Y' && answer != 'N' do
        answer = ask_answer("Wrong answer pick between y/n \n#{question}")
        if answer == 'y' || answer == 'Y'
          puts "Deleting folder #{folder}"
          FileUtils.rm_rf(folder)
        end
        puts "Aborting" if answer == 'n' || answer == 'N'
      end
    else
      puts "Deleting folder #{folder}"
      FileUtils.rm_rf(folder)
    end
  end
end

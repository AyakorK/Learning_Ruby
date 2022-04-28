require 'fileutils'

class Folder
  $file_to_del = ".important"

  def self.check_folder(folder)

    return false if !File.directory?(folder)

    folders = Dir.entries(folder)
    return true if check_important(folders)

    folders.each do |f|
      next if f.include?(".")
      if File.directory?("#{folder}/#{f}")
        subfolder= "#{folder}/#{f}"
        puts "Found subfolder: #{subfolder}"
        return true if check_folder(subfolder)
      end
    end
    return false
  end

  def self.check_important(folders)
    return false unless folders.include?("#{$file_to_del}")
      puts "Found #{$file_to_del} file"
      return true
    end

  def self.ask_answer(question)
    puts question
    return gets.chomp
  end

  def self.delete_folder(folder = null)
    responses = ["y", "n", "Y", "N"]

    if !File.directory?(folder)
      puts "Folder does not exist"
      return
    end

    if check_folder(folder)
      question = "This folder #{folder} contains a #{$file_to_del} file, do you want to delete it? (y/n)"
      answer = ask_answer(question)

      while !responses.include?(answer) do
        hasAnswered = true
        answer = ask_answer("Wrong answer pick between y/n \n#{question}")
      end
      
      if answer == 'y' || answer == 'Y'
        puts "Deleting folder #{folder}"
        FileUtils.rm_rf(folder)
      end
      puts "Aborting" if answer == 'n' || answer == 'N'
      
    else
      puts "Deleting folder #{folder}"
      FileUtils.rm_rf(folder)
    end
  end
end

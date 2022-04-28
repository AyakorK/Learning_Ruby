# frozen_string_literal: true

require 'fileutils'

# All methods for our folder
class Folder
  def self.check_folder(folder, file_to_del)
    return false unless File.directory?(folder)

    folders = Dir.entries(folder)
    return true if check_important(folders, file_to_del)

    folders.each do |f|
      next if f.include?('.')

      next unless File.directory?("#{folder}/#{f}")

      subfolder = "#{folder}/#{f}"
      puts "Found subfolder: #{subfolder}"
      return true if check_folder(subfolder)
    end
    false
  end

  def self.check_important(folders, file_to_del)
    # puts "Checking important files in folder: " + folders.to_s
    return false unless folders.include?(file_to_del.to_s)

    puts "Found #{file_to_del} file"
    true
  end

  def self.ask_answer(question)
    puts question
    gets.chomp
  end

  def self.delete_folder(folder = null)
    responses = %w[y n Y N]

    unless File.directory?(folder)
      puts 'Folder does not exist'
      return
    end

    if check_folder(folder, file_to_del)
      file_to_del = '.important'
      question = "This folder #{folder} contains a #{file_to_del} file, do you want to delete it? (y/n)"
      answer = ask_answer(question)

      answer = ask_answer("Wrong answer pick between y/n \n#{question}") until responses.include?(answer)

      if %w[y Y].include?(answer)
        puts "Deleting folder #{folder}"
        FileUtils.rm_rf(folder)
      end
      puts 'Aborting' if %w[n N].include?(answer)

    else
      puts "Deleting folder #{folder}"
      FileUtils.rm_rf(folder)
    end
  end
end

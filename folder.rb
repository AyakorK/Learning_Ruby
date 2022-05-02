# frozen_string_literal: true

require 'fileutils'

# All methods for our folder
class Folder
  def self.check_folder?(folder, file_to_del)
    return unless File.directory?(folder)

    folders = Dir.entries(folder)
    if check_important?(folders, file_to_del)
      puts 'You have important files in this folder'
      return true
    end

    folders.each do |f|
      next if f.include?('.')
      next unless File.directory?("#{folder}/#{f}")

      subfolder = "#{folder}/#{f}"
      return if check_folder?(subfolder, file_to_del)
    end
    false
  end

  def self.check_important?(folders, file_to_del)
    return unless folders.include?(file_to_del.to_s)

    true
  end

  def self.ask_answer(question)
    puts question
    $stdin.gets.chomp
  end

  def self.delete_folder(folder = null)
    responses = %w[y n Y N]
    file_to_del = '.important'

    unless File.directory?(folder)
      puts 'Folder does not exist'
      return
    end

    if check_folder?(folder, file_to_del) != false

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

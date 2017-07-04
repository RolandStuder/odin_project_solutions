module Prompt
  def prompt(text,options = {})
    puts text
    valid_responses = options[:valid_responses]
    loop do
      puts "Possible options: #{valid_responses.join}" if valid_responses
      input = gets.chomp
      valid_responses.map!(&:downcase) if valid_responses
      if valid_responses && valid_responses.include?(input.downcase)
        return input
      elsif valid_responses
        puts "Invalid Response"
        next
      else
        return input
      end
    end
  end
end
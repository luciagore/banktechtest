
# frozen_string_literal: true

class Printer
  def print_statement(statement)
    puts "date || credit || debit || balance\n"
    statement.each do |log|
      puts log
    end
  end
end

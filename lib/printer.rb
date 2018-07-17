
# frozen_string_literal: true

class Printer
  def print_statement(statement)
    statement.each do |log|
      puts log
    end
  end
end

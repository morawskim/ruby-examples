require 'readline'


Readline.completion_proc = proc do |input|

  line = Readline.line_buffer
  index = Readline.point

  #command cant have space :/
  chunks = Readline.line_buffer.split(' ', 2)
  command = chunks[0]

  if chunks.size == 0 || chunks.size == 1 && line == input
    # completions for commands
    completions = ['help', 'example']
  else
    case command
      when 'help'
        completions = []
      when 'example'
        completions = ['option', 'qwe', 'zxc', 'zbnm', 'something with space']
      else
        completions = []
    end
  end

  completions.select { |name| name.start_with?(input) }
end

Readline.basic_word_break_characters = ' '
Readline.completer_quote_characters = '"\''


while input = Readline.readline('> ', true)
  puts "You entered #{input}"
end

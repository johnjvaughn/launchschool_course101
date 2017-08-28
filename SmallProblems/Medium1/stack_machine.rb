def minilang(command)
  register = 0
  stack = []
  command.split.each do |cmd|
    case cmd
    when 'PUSH'
      stack << register
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      if stack.last == 0
        puts "ERROR DIV by ZERO"
        return "Error"
      end
      register /= stack.pop
    when 'MOD'
      if stack.last == 0
        puts "ERROR MOD by ZERO"
        return "Error"
      end
      register %= stack.pop
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    else # n
      register = cmd.to_i
      if (register.to_s != cmd)
        puts "ERROR with cmd #{cmd}"
        return "Error"
      end
    end
    puts "#{stack} #{register}" unless cmd == 'PRINT'
  end
  nil
end

puts "write a minilang program to do: (3 + (4 * 5) - 7) / (5 % 3)"
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')



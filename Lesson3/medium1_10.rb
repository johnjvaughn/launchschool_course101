puts <<-ANS
A. The result should be 'no'.
foo always returns 'yes'
so bar(foo) is bar('yes'), and
bar only returns 'yes' if its argument
is 'no', so bar('yes') returns 'no'.

ANS

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)
require 'fiddle'

# On your system path may be different
lib = Fiddle.dlopen('/lib64/libc.so.6')

strlen = Fiddle::Function.new(
    lib.sym('strlen'),
    [Fiddle::TYPE_VOIDP],
    Fiddle::TYPE_INT
)

str = "1234567890"
length = strlen.call(str)

puts "libc strlen function return #{length}"
puts "Ruby String.length return #{str.length}"

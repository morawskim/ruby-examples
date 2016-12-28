require 'fiddle'

# On your system path may be different
lib = Fiddle.dlopen('/lib64/libc.so.6')

getuid = Fiddle::Function.new(
    lib.sym('getuid'), # get address of function getuid
    [], # getuid function dont have arguments. See man 3 getuid
    Fiddle::TYPE_INT # getuid retur type. See man 3 getuid
)

puts "Libc getuid return #{getuid.call()}"
puts "Ruby Process.uid return #{Process.uid}"


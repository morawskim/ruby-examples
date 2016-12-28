require 'fiddle'

lib = Fiddle.dlopen('/lib64/libc.so.6')

strchr = Fiddle::Function.new(
    lib.sym('strchr'),
    [Fiddle::TYPE_VOIDP, Fiddle::TYPE_INT],
    Fiddle::TYPE_VOIDP
)

result = strchr.call("abcdef", 'c'.ord)
p result
p result.to_s


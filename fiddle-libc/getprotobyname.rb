require 'fiddle'
require 'fiddle/struct'

# require 'fiddle/cparser'
# include Fiddle::CParser
# parse_struct_signature(['char  *p_name', 'char **p_aliases', 'int    p_proto'])
types, members = [[1, 1, 4], ["p_name", "p_aliases", "p_proto"]];
protoent = Fiddle::CStructBuilder.create(Fiddle::CStruct, types, members)

# On your system path may be different
lib = Fiddle.dlopen('/lib64/libc.so.6')

getprotobyname = Fiddle::Function.new(
    lib.sym('getprotobyname'),
    [Fiddle::TYPE_VOIDP],
    Fiddle::TYPE_VOIDP
)

protoname = 'tcp'
pointer = getprotobyname.call(protoname)
struct = protoent.new pointer

puts "Libc getprotobyname return for field p_name value " +
        "'#{struct.p_name.to_s}', for field p_aliases value " +
        "'#{struct.p_aliases.ptr.to_s}' and for field p_proto value " +
        "'#{struct.p_proto.to_s}'"

puts "You can compare this values with these (from getent):"
puts `getent protocols #{protoname}`


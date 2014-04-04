#
# gee-views 0.01
#
# This is gdb macros to print gee containaers contents,
# size, type and more.
#
# gee-views is licensed under GPL2.
# Copyright(c) Yusuke Ishida.
#


#--------------------------------------
# local function prints gee container
#   $arg0 : variable of gee container
#   $arg1 : bit flag
#     (0x0001) elemet type is GObject
#     (0x0002) print index number

define _local_pgee
	set $type = g_type_name(gee_traversable_get_element_type($arg0))
	set $size = gee_abstract_collection_get_size($arg0)
	set $it = gee_abstract_collection_iterator($arg0)
	set $cnd = gee_iterator_next($it)
	set $i = 0

	while $cnd
		if $arg1 & 0x0002
			printf "[%d]:", $i
			set $i++
		end

		set $elem = gee_iterator_get($it)

		if $arg1 & 0x0001
			if $elem
				set $dummy = g_object_unref($elem)
			end
			eval "p *(%s*)$elem", $type
		else
			eval "p (%s)$elem", $type
		end

		set $cnd = gee_iterator_next($it)
	end

	if $it
		set $dummy = g_object_unref($it)
	end

	printf "size = %d\n", $size
	printf "type = %s\n", $type
end


#--------------------------------------

define pgee
	_local_pgee $arg0 0
end

document pgee

Prints Gee container contents, size and type.
Syntax: pgee <variable>
This function use a user heap memory.
And operate a reference counter of elements that contains the container.
If the container contains elements inherited GObject, use `pgeeo' instead.

end


#--------------------------------------

define pgeeo
	_local_pgee $arg0 0x0001
end

document pgeeo

Prints Gee container contents (GObject), size and type.
Syntax: pgeeo <variable>
This function use a user heap memory.
And operate a reference counter of elements that contains the container.
The container element type must be inherited GObject.

end

#--------------------------------------

define pgeel
	_local_pgee $arg0 0x0002
end

document pgeel

Prints Gee container (list) contents, index, size and, type.
Syntax: pgeel <variable>
This function use a user heap memory.
And operate a reference counter of elements that contains the container.
If the container contains elements inherited GObject, use `pgeeol' instead.

end


#--------------------------------------

define pgeeol
	_local_pgee $arg0 (0x0001|0x0002)
end

document pgeeol

Prints Gee container (list) contents (GObject), index, size and type.
Syntax: pgeeo <variable>
This function use a user heap memory.
And operate a reference counter of elements that contains the container.
The container element type must be inherited GObject.

end



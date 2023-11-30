function seq_info(x::String)
	size_count = 0
	gc_count = 0
	for i in x
	    size_count += 1
	    if i == 'G' || i == 'C'
	    	gc_count += 1
	    end
	end
	gc_content = gc_count / length(x) * 100 
	return size_count, gc_content
end

function seq_complement(x::String)
	comp_strand = Vector{Char}()
	for i in x
		if i == 'A'
			push!(comp_strand, 'T')
		elseif i == 'T'
			push!(comp_strand, 'A')
		elseif i == 'C'
			push!(comp_strand, 'G')
		elseif i == 'G'
			push!(comp_strand, 'C')
		end
	end
	final_comp_strand = reverse(join(comp_strand, ""))
	return final_comp_strand
end

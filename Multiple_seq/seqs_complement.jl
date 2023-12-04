function seqs_complement(x::Vector{String})

	comp_strands = Vector{String}(fill("", length(x)))
	
	for (i, seq) in enumerate(x)
	comp_strand = Vector{Char}()
		for j in seq
			if j == 'A'
				push!(comp_strand, 'T')
			elseif j == 'T'
				push!(comp_strand, 'A')
			elseif j == 'C'
				push!(comp_strand, 'G')
			elseif j == 'G'
				push!(comp_strand, 'C')
			end
		end
		comp_strands[i] = reverse(join(comp_strand))
	end
	return comp_strands
end

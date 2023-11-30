function find_motif(motif::String, sequence::String)
	if length(motif) > length(sequence)
	    error("The motif is longer than actual sequence")
	end
	positions = Vector{Int64}()
	for i in 1:length(sequence) - length(motif) + 1
		if sequence[i:i + length(motif) - 1] == motif
			push!(positions, i)
		end
	end
	if isempty(positions)
		println("No motif identified")
	end
	return positions
end

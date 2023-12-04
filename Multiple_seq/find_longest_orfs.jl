function find_longest_orfs(x::Vector{String})
    longest_orfs = Vector{String}()
    for seq in x
	    longest_orf_start = 0
	    longest_orf_end = 0
	    for start_pos in 1:3
	        i = start_pos
	        while i <= length(seq) - 2
	            codon = seq[i:i+2]
	            if codon == "ATG"
	                last_start_pos = i
	                i += 3
	                orf_start = last_start_pos
	                while i <= length(seq) - 2
	                    codon = seq[i:i+2]
	                    if codon == "TAA" || codon == "TAG" || codon == "TGA"
	                        orf_end = i + 2
	                        if orf_end - orf_start > longest_orf_end - longest_orf_start
	                            longest_orf_start = orf_start
	                            longest_orf_end = orf_end
	                        end
	                        i += 3
	                        break
	                    else
	                        i += 3
	                    end
	                end
	            else
	                i += 3
	            end
	        end
	    end
	    if longest_orf_start > 0
	    	longest_orf = seq[longest_orf_start:longest_orf_end]
	    	push!(longest_orfs, longest_orf)
	    end
    end
    return longest_orfs
end

function read_fasta(filename)
	if !isfile("$filename")
   	 error("'$filename' não é um arquivo")
	end

	input = open("$filename", "r")

	#Every sequence (seq) is stored in a vector of chars (seqs)
	seqs = Vector{String}()
	global seq = Vector{Char}()
	seq_descr = Vector{String}()

	for line in eachline(input)
    	if startswith(line, '>')
        	if !isempty(seq)
        	    push!(seqs, uppercase(join(seq)))    
        	end
        	push!(seq_descr, line[2:end])
        	global seq = Vector{Char}()
    	else 
        	seq = vcat(seq, collect(line))
    	end
	end

	if !isempty(seq)
	    	push!(seqs, uppercase(join(seq)))
	end

	close(input)
	return seqs, seq_descr
end

# For printing the sequence as a String:
# seqs_combined = [String(seq) for seq in a]

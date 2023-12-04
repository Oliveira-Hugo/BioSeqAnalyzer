function read_fasta(filename::AbstractString)
	if !isfile("$filename")
   	 error("'$filename' não é um arquivo")
	end

	input = open("$filename", "r")

	#Every sequence (seq) is stored in a vector of chars (seqs)
	global seq = Char[]

	for line in eachline(input)
    	if startswith(line, '>')

    	else 
        	seq = vcat(seq, collect(line))
    	end
	end

	close(input)
	return String(seq)
end

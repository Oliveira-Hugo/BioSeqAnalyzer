include("read_multiple_fasta.jl")
include("seqs_info.jl")
include("seqs_complement.jl")
include("seqs_translate.jl")
include("find_motifs.jl")
include("find_longest_orfs.jl")
include("find_longest_shared_motif.jl")

using Statistics

function interactive_menu()
    println("Enter the FASTA file name (between quotation marks):\n")
    dna_sequence = strip(readline())
    directory = dna_sequence[2:length(dna_sequence)-1]
    dna_sequences, dna_sequences_description = read_fasta(directory)
    
    println("\nChoose a function:")
    println("1. Retrieve basic information about the DNA/RNA sequences")
    println("2. Obtain the reverse complement of the DNA sequences")
    println("3. Translate the given RNA sequences")
    println("4. Locate a motif in your DNA/RNA sequences")
    println("5. Find the longest shared motif among your DNA/RNA sequences")
    println("6. Find the longest ORF in the sequences (reverse complements are not included)")
    println("7. Enter new FASTA file")
    println("0. Exit\n")

    choice = parse(Int, readline())

    while choice != 0
        if choice == 1
            size, gc = seqs_info(dna_sequences)
            av_size = mean(size)
            av_gc = mean(gc)
            println("\nYour DNA/RNA sequences have mean size of $av_size bp and mean gc content of $av_gc")
            for (i, seq) in enumerate(dna_sequences_description)
            	println("Seq $(dna_sequences_description[i]) info: size: $(size[i])bp, gc: $(gc[i])%")
            end
        elseif choice == 2
    	        if any(seq -> occursin('U', seq), dna_sequences)
        	    println("\nRNA sequence is not applicable for this function")
    	    	else
        	    complementary_sequence = seqs_complement(dna_sequences)
        	    println("\nThe reverse complement of the given sequence is:\n $complementary_sequence")
    	    	end
        elseif choice == 3
            if any(seq -> occursin('T', seq), dna_sequences)
       	    	println("\nDNA sequence is not applicable for this function")
    	    else
                seqs_translate_result = seqs_translate(dna_sequences)
            	println("\nTranslation of the given RNA sequence:\n")
            	for (i, seq) in enumerate(dna_sequences)
	            println("Seq $(dna_sequences_description[i]): $(seqs_translate_result[i])")
	        end
            end
        elseif choice == 4
            println("\nEnter the motif:\n")
            motifs_seq = uppercase(strip(readline()))
            find_motifs_result = find_motifs(motifs_seq, dna_sequences)
            println("\nMotifs found:\n")
  	    for i in 1:length(find_motifs_result)
        	if isempty(find_motifs_result[i])
            	    println("Seq $(dna_sequences_description[i]), motif not identified")
        	else                    
            	    println("Seq $(dna_sequences_description[i]), position(s): $(find_motifs_result[i])")
      	   	end
      	    end
    	elseif choice == 5
            lsm = longest_shared_motif(dna_sequences)
            if lsm == ""
            	println("\nNo common motif identified")
            else
            	println("\nLongest shared motif found:\n $lsm")
            end
    	elseif choice == 6
            if any(seq -> occursin('U', seq), dna_sequences)
            	println("\nRNA sequence is not applicable for this function")
            else
            	find_longest_orf_result = find_longest_orfs(dna_sequences)
            	println("\n")
            	for i in 1:length(find_longest_orf_result)
            	    if find_longest_orf_result[i] == ""
            	        println("Seq $(dna_sequences_description): no ORF found")
            	    else 
            	        println("Seq $(dna_sequences_description): longest ORF:\n$(find_longest_orf_result[i])\n")
            	    end
                end
            end
        elseif choice == 7
   	    dna_sequence = strip(readline())
    	    directory = dna_sequence[2:length(dna_sequence)-1]
    	    dna_sequences, dna_sequences_description = read_fasta(directory)
    	    println(dna_sequences)
        else
            println("Invalid choice. Try again.")
        end

   	println("\nChoose a function:")
   	println("1. Retrieve basic information about the DNA/RNA sequences")
   	println("2. Obtain the reverse complement of the DNA sequences")
   	println("3. Translate the given RNA sequences")
   	println("4. Locate a motif in your DNA/RNA sequences")
   	println("5. Find the longest shared motif among your DNA/RNA sequences")
   	println("6. Find the longest ORF in the sequences (reverse complements are not included)")
   	println("7. Enter new FASTA file")
   	println("0. Exit\n")

        choice = parse(Int, readline())
    end

    println("Exiting.")
end

interactive_menu()


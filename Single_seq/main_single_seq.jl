include("read_single_fasta.jl")
include("seq_info.jl")
include("seq_complement.jl")
include("seq_translate.jl")
include("find_motif.jl")
include("find_longest_orf.jl")

function interactive_menu()
    println("Enter your sequence (continuosly, in a single line) or the address to the FASTA file (between quotation marks):\n")
    dna_sequence = strip(readline())
    directory = ""
    if startswith(dna_sequence, '>')
        dna_sequence = uppercase(dna_sequence[2:length(dna_sequence)])	
    elseif startswith(dna_sequence, '"')
        directory = dna_sequence[2:length(dna_sequence)-1]
        dna_sequence = read_fasta(directory)
    else
        dna_sequence = uppercase(dna_sequence)
    end
    
    println("\nChoose a function:")
    println("1. Retrieve basic information about the DNA/RNA sequence")
    println("2. Obtain the reverse complement of the DNA sequence")
    println("3. Translate the original RNA sequence")
    println("4. Find a motif in your DNA/RNA sequence")
    println("5. Find the longest ORF in the sequence (complement not included)")
    println("6. Enter new sequence")
    println("0. Exit\n")

    choice = parse(Int, readline())

    while choice != 0
        if choice == 1
            size, gc = seq_info(dna_sequence)
            println("Your DNA/RNA sequence is $size bp long and contains a gc% of $gc")
        elseif choice == 2
            if occursin('U', dna_sequence)
            	println("RNA sequence is not applicable for this function")
            else
                complementary_sequence = seq_complement(dna_sequence)
		println("The reverse complement of the given sequence is:\n $complementary_sequence")
	    end            	
        elseif choice == 3
            seq_translate_result = seq_translate(dna_sequence)
            println("Translation of the given RNA sequence:\n $seq_translate_result")
        elseif choice == 4
            println("Enter the motif:\n")
            motif_seq = uppercase(strip(readline()))
            find_motif_result = find_motif(motif_seq, dna_sequence)
            println("Motif found in positions:\n $find_motif_result")
        elseif choice == 5
            if occursin('U', dna_sequence)
            	println("RNA sequence is not applicable for this function")
            else
            	find_longest_orf_result = find_longest_orf(dna_sequence)
            	println("Longest ORF found:\n $find_longest_orf_result")
            end
        elseif choice == 6
            dna_sequence = strip(readline())
    	    directory = ""
    		if startswith(dna_sequence, '>')
                    dna_sequence = uppercase(dna_sequence[2:length(dna_sequence)])	
    		elseif startswith(dna_sequence, '"')
        	    directory = dna_sequence[2:length(dna_sequence)-1]
        	    dna_sequence = read_fasta(directory)
    		else
	            dna_sequence = uppercase(dna_sequence)
    		end
        else
            println("Invalid choice. Try again.")
        end

        println("\nChoose a function:")
        println("1. Retrieve basic information about the DNA/RNA sequence")
        println("2. Obtain the reverse complement of the DNA sequence")
        println("3. Translate the original RNA sequence")
        println("4. Find a motif in your DNA/RNA sequence")
        println("5. Find the longest ORF in the sequence (complement not included)")
 	println("6. Enter new sequence")
        println("0. Exit\n")

        choice = parse(Int, readline())
    end

    println("Exiting.")
end

# Run the interactive menu
interactive_menu()


function find_longest_orf(x::String)
    longest_orf_start = 0
    longest_orf_end = 0
    
    # Consider only three forward reading frames
    for start_pos in 1:3
        i = start_pos

        while i <= length(x) - 2
            codon = x[i:i+2]

            if codon == "ATG"
                last_start_pos = i
                i += 3  # Move to the next codon
                orf_start = last_start_pos
                while i <= length(x) - 2
                    codon = x[i:i+2]
                    if codon == "TAA" || codon == "TAG" || codon == "TGA"
                        orf_end = i + 2
                        if orf_end - orf_start > longest_orf_end - longest_orf_start
                            longest_orf_start = orf_start
                            longest_orf_end = orf_end
                        end
                        i += 3  # Move to the next codon
                        break
                    else
                        i += 3  # Move to the next codon
                    end
                end
            else
                i += 3  # Move to the next codon
            end
        end
    end
    
    if longest_orf_start > 0
        longest_orf = x[longest_orf_start:longest_orf_end]
        return longest_orf
    else
        return "No valid start codon found."
    end
end

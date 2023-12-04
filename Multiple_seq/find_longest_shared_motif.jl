function longest_shared_motif(sequences::Vector{String})
    n = length(sequences)
    overall_max_length = 0
    overall_common_substring = Vector{Char}()

    for i in 1:length(sequences[1])
        for j in (i + overall_max_length):length(sequences[1])
            substring_candidate = sequences[1][i:j]	

            if all(x -> occursin(join(substring_candidate), join(x)), sequences[2:end])
                overall_max_length = length(substring_candidate)
                overall_common_substring = substring_candidate
            end
        end
    end

    return join(overall_common_substring)
end

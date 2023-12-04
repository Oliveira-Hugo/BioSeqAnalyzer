function find_motifs(motif::String, sequences::Vector{String})
    positions = Vector{Vector{Int}}(undef, length(sequences))

    for (j, seq) in enumerate(sequences)
        positions[j] = Vector{Int}()

        if length(motif) > length(seq)
            push!(positions[j], 0)
        else
            for i in 1:length(seq) - length(motif) + 1
                if seq[i:i + length(motif) - 1] == motif
                    push!(positions[j], i)
                end
            end
        end
    end

    return positions
end


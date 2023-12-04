function seqs_info(x::Vector{String})
    size_count = Vector{Int}(fill(0, length(x)))
    gc_count = Vector{Int}(fill(0, length(x)))
    gc_content = Vector{Float64}(fill(0, length(x)))
   
    for (i, seq) in enumerate(x)
        for j in seq
            size_count[i] += 1
            if j == 'G' || j == 'C'
                gc_count[i] += 1
            end
        end
    end

    for i in 1:length(x)
        gc_content[i] = gc_count[i] / size_count[i] * 100
    end

    return size_count, gc_content
end

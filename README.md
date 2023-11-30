# Bioinformatics
Authoral Julia code for solving bioinformatics/computational biology problems

The program is divided into a main function that parses single sequence information (main_single_seq.jl) and one that parses multiple sequences (main_multiple_seq.jl).
All required functions are called by the main, and the user only needs to insert the input and select the parsing option.

The selecting menu looks like:

`Choose a function:
1. Retrieve basic information about the DNA/RNA sequence
2. Obtain the reverse complement of the DNA sequence
3. Translate the original RNA sequence
4. Find a motif in your DNA/RNA sequence
5. Find the longest ORF in the sequence (complement not included)
6. Enter new sequence
0. Exit`

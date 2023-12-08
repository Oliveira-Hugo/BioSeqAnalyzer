# BioSeqAnalyzer
A collection of authoral Julia code for biological sequences analysis. The codebase is organized into modules designed for the analysis of both single and multiple sequences, with a current emphasis on DNA and RNA functionalities. Future updates include toolkit for (single/multiple) protein sequences analysis.

The program is divided into a main function that parses single sequence information (main_single_seq.jl) and one that parses multiple sequences (main_multiple_seq.jl).
All required functions are called by the main, and the user only needs to insert the input and select the parsing option.

The selecting menu looks like:

```Choose a function:
1. Retrieve basic information about the DNA/RNA sequence(s)
2. Obtain the reverse complement of the DNA sequence(s)
3. Translate the original RNA sequence(s)
4. Find a motif in your DNA/RNA sequence(s)
5. Find the longest shared motif among your sequences
6. Find the longest ORF in the sequence(s) (complement not included)
7. Enter new sequence(s)
0. Exit

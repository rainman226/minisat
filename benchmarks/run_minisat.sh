#!/bin/bash

# Define an array with the list of benchmark files
benchmark_files=("08ccc34df5d8eb9e9d45278af3dc093d-simon-r16-1.sanitized.cnf" "089f909e37b3ef0c4d90687f7e22b68f-simon-r18-0.sanitized.cnf" "4073757aae06fc2b50c043f088b132b4-simon-r19-1.sanitized.cnf" "3129198788f182ce6955b18aa3c7e61e-simon-r24-1.sanitized.cnf" "cdce6277b01ae06ddb95468c5f05de71-simon-r17-0.sanitized.cnf")

# Create or clear the console_log file
console_log="console_log"
> "$console_log"

# Loop over each benchmark file and generate a corresponding output file name
for i in "${!benchmark_files[@]}"; do
    benchmark="${benchmark_files[$i]}"
    output="output_file$((i + 1))"  # Generate output file name as output_file1, output_file2, etc.
    
    # Run MiniSat with a 10-second limit using -cpu-lim, and append console output to console_log
    echo "Running MiniSat on $benchmark with output to $output" | tee -a "$console_log"
    minisat -cpu-lim=8640 "$benchmark" "$output" >> "$console_log" 2>&1
    
    # Add a separator for clarity in the console_log
    echo "------------------------------------" >> "$console_log"
done


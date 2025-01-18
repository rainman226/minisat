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

    # Print the starting message and log it
    echo "Running MiniSat on $benchmark with output to $output" | tee -a "$console_log"

    # Run MiniSat with a 10-second limit using -cpu-lim, display output live, and log to console_log
    minisat -var-decay=0.95 -cla-decay=0.93 -rfirst=200 "$benchmark" "$output" 2>&1 | tee -a "$console_log"

    # Add a separator for clarity in the console_log
    echo "------------------------------------" | tee -a "$console_log"

done


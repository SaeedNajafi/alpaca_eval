#!/usr/bin/env python3
import os
import argparse
import sys

def find_logs_with_header(directory):
    """
    Scans a directory for .log files containing a specific header line.

    Args:
        directory (str): The path to the directory to scan.
    """
    # This is the exact header line we are looking for.
    # Using a variable makes it easy to change if needed.
    target_header = "length_controlled_winrate  win_rate  standard_error  n_total  avg_length"

    # Check if the provided directory is valid
    if not os.path.isdir(directory):
        print(f"Error: Directory not found at '{directory}'", file=sys.stderr)
        sys.exit(1)

    # os.listdir gives us all files and folders in the directory
    for filename in os.listdir(directory):
        # We only care about files that end with the .log extension
        if filename.endswith(".log"):
            # Construct the full path to the file for opening
            full_path = os.path.join(directory, filename)

            try:
                # Use 'with open' to ensure the file is properly closed
                with open(full_path, 'r', encoding='utf-8', errors='ignore') as f:
                    # Read the file line by line to avoid loading large files into memory
                    for line in f:
                        # strip() removes leading/trailing whitespace (like newlines)
                        # We check if the line is an exact match for our target header
                        if line.strip() == target_header:
                            # If we find the line, print the filename
                            print(filename)
                            # We found what we were looking for, no need to read the rest of this file.
                            # This 'break' makes the script more efficient.
                            break
            except IOError as e:
                # Print an error message to standard error if a file can't be read
                print(f"Could not read file {filename}: {e}", file=sys.stderr)


if __name__ == "__main__":
    # Set up the command-line argument parser for user-friendliness
    parser = argparse.ArgumentParser(
        description="Find .log files in a directory that contain a specific header line and print their names."
    )

    # Add an argument for the directory.
    # 'default="."' makes it search the current directory if none is provided.
    parser.add_argument(
        "--directory",
        nargs="?",
        default=".",
        help="The directory to search for .log files (defaults to the current directory)."
    )

    args = parser.parse_args()

    # Call the main function with the provided directory
    find_logs_with_header(args.directory)
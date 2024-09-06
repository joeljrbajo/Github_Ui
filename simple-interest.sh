#!/bin/bash

# Simple Interest Calculator

# Function to calculate simple interest
calculate_simple_interest() {
  local principal=$1
  local rate=$2
  local time=$3

  # Formula: Interest = Principal * Rate * Time / 100
  local interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
  echo "The Simple Interest is: $interest"
}

# Check if the correct number of arguments are passed
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <principal> <rate> <time>"
  exit 1
fi

# Read input values
principal=$1
rate=$2
time=$3

# Validate that inputs are numeric
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Error: All inputs must be numeric values."
  exit 1
fi

# Calculate and display the interest
calculate_simple_interest "$principal" "$rate" "$time"


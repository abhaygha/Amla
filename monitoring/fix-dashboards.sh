#!/bin/bash

echo "Fixing dashboard JSON files..."

for file in grafana/dashboards/*.json; do
    echo "Processing $file..."
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Remove the outer "dashboard" wrapper and keep only the inner content
    # Also remove the trailing "}" that was left behind
    sed '1s/^{"dashboard":{/{/; $s/}$//' "$file" > "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
    
    echo "Fixed $file"
done

# Fix Loki dashboards if present
if [ -d "grafana/dashboards" ]; then
    for file in grafana/dashboards/*loki*.json; do
        if [ -f "$file" ]; then
            echo "Processing Loki dashboard $file..."
            temp_file=$(mktemp)
            sed '1s/^{"dashboard":{/{/; $s/}$//' "$file" > "$temp_file"
            mv "$temp_file" "$file"
            echo "Fixed $file"
        fi
    done
fi

echo "All dashboard files fixed!"


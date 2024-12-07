#!/bin/bash

# Initialize an empty file for the consolidated timeline
> consolidated_commits.txt

# Initialize branch tracking
declare -A branch_map
branch_counter=1

# Extract all commits
git log --all --pretty=format:"%h %p %s" | while read -r commit_hash parents message; do
    # Default branch assignment
    branch="unknown"

    # Query branch name for the commit using 'git name-rev'
    branch_info=$(git name-rev --name-only --always $commit_hash 2>/dev/null)

    # Determine if it's a main commit or a branch commit
    if [[ "$branch_info" =~ \^ ]]; then
        # Extract the base and branch position
        base_branch=$(echo "$branch_info" | sed 's/\^.*//')  # e.g., "main~16"
        branch_position=$(echo "$branch_info" | grep -oP '\^[\d~]+' | tr -d '^')  # e.g., "2" or "2~1"

        # Assign a branch label if not already assigned
        if [[ -z "${branch_map[$base_branch]}" ]]; then
            branch_map[$base_branch]="branch-$branch_counter"
            branch_counter=$((branch_counter + 1))
        fi
        branch="${branch_map[$base_branch]}"
    else
        # It's a main commit
        branch="main"
    fi

    # Append commit details to the consolidated timeline with the correct branch label
    echo "$commit_hash - $message ($branch)" >> consolidated_commits.txt
done

# Sort and deduplicate the final output
sort -u consolidated_commits.txt > commits.txt
echo "Consolidated timeline saved to commits.txt"

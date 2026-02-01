#!/bin/bash

# Folder to watch
WATCH_DIR="/Users/starlanan/Desktop/MSc in AI for Business/Subjects/Customer Engagement and Artificial Intelligence/Projects/Expense Tracker"

# Watch for any changes and sync automatically
fswatch -o "$WATCH_DIR" | while read f
do
    cd "$WATCH_DIR"
    
    # Only commit if there are changes
    if ! git diff --quiet || ! git diff --cached --quiet; then
        git add .
        git commit -m "Auto-sync changes $(date '+%Y-%m-%d %H:%M:%S')"
        git pull --rebase origin main
        git push origin main
    fi
done



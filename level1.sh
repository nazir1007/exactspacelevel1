largestFile=""
fileSize=0

for file in *.log; do
    size=$(stat --format=%s "$file")
    if (( size > fileSize )); then
        fileSize="$size"
        largestFile="$file"
    fi
done

if [[ -n "$largestFile" ]]; then
    echo "The largest log file is: $largestFile"
    
    tail --lines=100 "$largestFile" > "$largestFile.tmp"
    mv "$largestFile.tmp" "$largestFile"

    echo "$largestFile truncated in to 100 lines."
else
    echo "No log files available in current directory."
fi





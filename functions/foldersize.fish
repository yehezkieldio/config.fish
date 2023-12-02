function foldersize -d "find the size of a folder"
    du -sh $argv | awk '{print $1}' | sed 's/G$//'
end
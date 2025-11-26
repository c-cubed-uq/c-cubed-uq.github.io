# change directory
cd static/videos/experiments

# target size matches bridge gt size
HEIGHT=480
WIDTH=640

# loop through all subfolders
for dir in */ ; do
    # enter subfolder, loop through subfolders
    echo "Dir: $dir"
    cd "$dir"
    for subdir in */ ; do
        echo "Subdir: $subdir"
        cd "$subdir"
        # loop through all mp4 files and resize
        for file in *.mp4 ; do
            [ -f "$file" ] || continue

            # get original dimensions
            dims=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0:s=x "$file")

            # skip if already correct size
            if [ "$dims" = "${WIDTH}x${HEIGHT}" ]; then
            echo "Skipping \"$file\" (already ${dims})"
            continue
            fi

            # rename original file
            mv -- "$file" "original_$file"

            # resize using ffmpeg, using original filename
            ffmpeg -i "original_$file" -vf "scale=${WIDTH}:${HEIGHT}" -y "$file"

            # remove original file
            rm -f -- "original_$file"

            echo "Processed $file"
        done
        # go back to parent directory
        cd ..
        done
    # go back to parent directory
    cd ..
done

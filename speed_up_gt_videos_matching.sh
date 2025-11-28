# # gt videos directory
# gt_dir=/Users/maymei/Desktop/temp_c3/bridge_gt

# # list of video ids to speed up
# video_ids=(
#     "42"
#     "46"
#     "66"
#     "94"
#     "107"
#     "151"
# )

# change directory
cd static/videos/experiments/ood

# speed up factor
factor=4

# frame rate
framerate=30

# gt filename
gt_filename=rgb

# loop through all subfolders
for dir in */ ; do
    # enter subfolder, loop through subfolders
    cd "$dir"
    for subdir in */ ; do
        cd "$subdir"
        # loop through all mp4 files and resize
        for file in *.mp4 ; do
            [ -f "$file" ] || continue

            if [[ ! "$file" == *"$gt_filename"* ]]; then
                continue
            fi

            # check if input file exists
            if [ ! -f "$file" ]; then
                echo "Input file $file does not exist. Skipping."
                continue
            fi

            # rename original file
            mv -- "$file" "original_$file"

            # speed up video using ffmpeg
            ffmpeg -i "original_$file" -filter:v "setpts=PTS/${factor}" -r "$framerate" "$file"
            echo "Processed $file"

            # remove original file
            rm -f -- "original_$file"
        done

        # go back to parent directory
        cd ..
        done
    # go back to parent directory
    cd ..
done
# gt videos directory
gt_dir=/Users/maymei/Desktop/temp_c3/bridge_gt

# list of video ids to speed up
video_ids=(
    "42"
    "46"
    "66"
    "94"
    "107"
    "151"
)

# speed up factor
factor=4

for vid in "${video_ids[@]}"; do
    input_path="$gt_dir/${vid}.mp4"
    output_path="static/videos/experiments/${vid}.mp4"

    # check if input file exists
    if [ ! -f "$input_path" ]; then
        echo "Input file $input_path does not exist. Skipping."
        continue
    fi

    # speed up video using ffmpeg
    ffmpeg -i "$input_path" -filter:v "setpts=PTS/4" "$output_path"
    echo "Processed $input_path -> $output_path"
done
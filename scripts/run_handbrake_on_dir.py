import subprocess, sys
from pathlib import Path

# config params
input_video_dir = Path("../static/").resolve()
output_video_dir = Path("../converted/static").resolve()

# your desired preset params for HANDBRAKE
HANDBRAKE_PRESET = "Fast 1080p30"             
EXECUTABLE = "/Applications/HandBrakeCLI"


for vid in input_video_dir.rglob("**/*.mp4"):
    # Compute relative path from videos_dir and use that in thumbs_dir
    rel_path = vid.relative_to(input_video_dir).with_suffix(".mp4")
    out_vid_path = output_video_dir / rel_path
    
    # make directory, if necessary
    out_vid_path.parent.mkdir(parents=True, exist_ok=True)

    if out_vid_path.exists():
        continue
    
    # print
    print(f"Processing: {vid}")
    print(f"Saving to:  {out_vid_path}")

    # Extract the very last frame
    cmd = [
        EXECUTABLE, 
        "-i", str(vid),
        "-o", str(out_vid_path),
        "--preset", HANDBRAKE_PRESET,
    ]
    
    if subprocess.call(cmd):
        print("  HANDBRAKE failed!", file=sys.stderr)
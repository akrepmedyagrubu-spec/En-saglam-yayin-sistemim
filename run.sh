#!/bin/bash

cd /app || exit

mkdir -p hls

# eski ffmpeg varsa öldür
pkill -9 ffmpeg 2>/dev/null

# web server
python3 -m http.server 10000 &

echo "YAYIN BASLADI"

KV_INDEX=1

while true
do
  for FILE in rj1.mp4 reklam.mp4 rj2.mp4 jenerik.mp4 akilli.mp4 kv${KV_INDEX}.mp4
  do
    echo "Oynatiliyor: $FILE"

    # logo seçimi
    if [[ "$FILE" == "reklam.mp4" ]]; then
      LOGO="reklam_logo.png"
    else
      LOGO="yayin_logo.png"
    fi

    ffmpeg -y -re -i "$FILE" -i "$LOGO" \
    -filter_complex "[0:v]scale=960:540:force_original_aspect_ratio=decrease,pad=960:540:(ow-iw)/2:(oh-ih)/2,fps=20,format=yuv420p[v0];[1:v]scale=960:540[v1];[v0][v1]overlay=0:0[outv]" \
    -map "[outv]" -map 0:a? \
    -c:v libx264 -preset ultrafast -crf 28 \
    -c:a aac -b:a 80k -ar 44100 -ac 2 \
    -f hls \
    -hls_time 3 \
    -hls_list_size 30 \
    -hls_flags delete_segments+append_list+omit_endlist \
    -hls_segment_filename hls/segment_%03d.ts \
    hls/stream.m3u8

  done

  ((KV_INDEX++))

  if [ ! -f "kv${KV_INDEX}.mp4" ]; then
    KV_INDEX=1
  fi

done

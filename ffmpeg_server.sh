#!/bin/sh
video_decode="-c:v h264_cuvid"
video_encode="-c:v h264_nvenc"
accel_0="-hwaccel_output_format cuda"
accel_1="-hwaccel cuvid"
# command="ffmpeg $accel_0 $accel_1 $video_decode -i $1 $video_encode ${@:2}"
command="ffmpeg $video_decode -i $1 $video_encode ${@:2}"
echo "Running $command"
$command

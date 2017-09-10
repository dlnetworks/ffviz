#!/bin/bash

echo "
######################################################################################
##                                         FFVIZ                                    ##
##                                         V 1.0                                    ##
######################################################################################
## usage: Configure the options below, save and execute                             ##
##                                                                                  ##
## $ ./ffviz.sh <input> <output>                                                    ##
##                                                                                  ##
## <input> should be the audio to analyze for visual reactions                      ##
## <output> should be a path to a local file, or a remote livestream server         ##
##                                                                                  ##
## populate playlist.txt with a list of video files to randomy choose from          ##
## include the full path                                                            ##
##                                                                                  ##
## here is an example using shoutcast/icecast as the audio source (remote)          ##
## and streaming the video out via rtmp to a livestream provider                    ##
##                                                                                  ##
## $ ./ffviz.sh http://127.0.0.1:8000/path rtmp://live.youtube.com/app/streamkey.   ##
##                                                                                  ##
## here is an example using local input and output files                            ##
##                                                                                  ##
## $ ./ffviz.sh /full/path/to/ffviz/audioinput.mp3 /full/path/to/ffviz/output.mp4   ##
##                                                                                  ##
########### script pre-requisits: ffmpeg, mediainfo, randomize-lines, bc  ############
##                                                                                  ##
##                      https://www.github.com/dlnetworks/ffviz                     ##
######################################################################################
";

#########################
## START CONFIGURATION ##
#########################

# path to video playlist.txt
playlist="/full/path/to/ffviz/playlist.txt";

# output frame size
outsize="1920x1080";

# frames per second
fps="60";

# video bitrate
bv="20M";

# audio bitrate
ba="256k";

# video codec
cv="h264";

# audio codec
ca="libfdk_aac";

# output container format
fmt="flv";

# base frequency (Hz)
bfreq="20";

# end frequency (Hz)
efreq="1420";

#######################
## END CONFIGURATION ##
#######################

randfile="$(cat "$playlist" | rl | head -1)";
duration="$(mediainfo --Inform="Video;%Duration/String3%" $randfile)";
viz="volume=2,showcqt=s=1920x144:text=0:r=$fps:axis=0:basefreq=$bfreq:endfreq=$efreq:count=15:sono_g=4:bar_g=4:bar_v=35:sono_h=144:sono_v=bar_v*a_weighting(f):tc=0.1,rotate=1200*sin(200*PI/200*t):ow=24:oh=24:c=none,scale=$outsize,setsar=1/1[viz];[1:v]scale=$outsize,setsar=1/1[vid1];[viz][vid1]blend=all_mode=heat:shortest=1:repeatlast=0,hue="H="2*PI*t/420""";
enc="-s $outsize -c:a $ca -b:a $ba -c:v $cv -preset ultrafast -b:v $bv -profile:v high -level 4.2 -g "$(bc <<< $fps*2)" -bf 2 -x264opts keyint="$(bc <<< $fps*2)":min-keyint="$(bc <<< $fps*2)":8x8dct=1 -pix_fmt yuv420p -r $fps";
ffmpeg -hide_banner -i "$1" -r $fps -i "$randfile" -filter_complex $viz $enc -t $duration -shortest -f $fmt "$2";

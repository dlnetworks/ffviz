# FFVIZ V1.0                                    

usage: Configure the options below, save and execute                             

$ ./ffviz.sh <input> <output>                                                    

<input> should be the audio to analyze for visual reactions                      
<output> should be a path to a local file, or a remote livestream server         

populate playlist.txt with a list of full paths to video files

here is an example using shoutcast/icecast as the audio source (remote) and streaming the video out via rtmp

$ ./ffviz.sh http://127.0.0.1:8000/path rtmp://live.youtube.com/app/streamkey

here is an example using local input and output files

$ ./ffviz.sh /full/path/to/audioinput.mp3 /full/path/to/ffviz/output.mp4

script pre-requisits: ffmpeg, mediainfo, randomize-lines, bc  

https://www.dlnetworks.net

# ffviz
A real time audio/video visualizer using ffmpeg filter complex. 

\####################################################################################\n\n
\#                                         FFVIZ                                    #\n\n
\#                                         V 1.0                                    #\n\n
\####################################################################################\n\n
\# usage: Configure the options below, save and execute                             #\n\n
\#                                                                                  #\n\n
\# $ ./ffviz.sh <input> <output>                                                    #\n\n
\#                                                                                  #\n\n
\# <input> should be the audio to analyze for visual reactions                      #\n\n
\# <output> should be a path to a local file, or a remote livestream server         #\n\n
\#                                                                                  #\n\n
\# populate playlist.txt with a list of video files to randomly choose from         #\n\n
\# use the full path                                                                #\n\n
\#                                                                                  #\n\n
\# here is an example using shoutcast/icecast as the audio source (remote)          #\n\n
\# and streaming the video out via rtmp to a livestream provider                    #\n\n
\#                                                                                  #\n\n
\# $ ./ffviz.sh http://127.0.0.1:8000/path rtmp://live.youtube.com/app/streamkey.   #\n\n
\#                                                                                  #\n\n
\# here is an example using local input and output files                            #\n\n
\#                                                                                  #\n\n
\# $ ./ffviz.sh /full/path/to/audioinput.mp3 /full/path/to/ffviz/output.mp4         #\n\n
\#                                                                                  #\n\n
\########## script pre-requisits: ffmpeg, mediainfo, randomize-lines, bc  ###########\n\n
\#                                                                                  #\n\n
\#                      https://www.github.com/dlnetworks/ffviz                     #\n\n
\#                            https://www.dlnetworks.net                            #\n\n
\####################################################################################\n\n

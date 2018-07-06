[![CircleCI](https://circleci.com/gh/mimacom/whtobu-ml/tree/master.svg?style=svg)](https://circleci.com/gh/mimacom/whtobu-ml/tree/master)

# whtobu-ml
Where To Buy ML Backend

## Download video from youtube

``youtube-dl <url>``

## Slice a video to images

``ffmpeg -i temp/Apple\ iPhone\ 7\ Plus\ Review-8GAvVuRrNVA.mkv -ss 00:01:00 -to 00:08:57 -vf fps=1 iamges/iphone-7-plus/out%d.png``

#!/bin/bash
ffmpeg -i apple-watch.mp4 -vf fps=0.5 apple-watch/image%04d.jpg

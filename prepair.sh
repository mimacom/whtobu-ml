#!/bin/bash

set -e

source activate.sh

function gen_grayscale_images {
        local filename=$1

        local new_filename=$(echo $filename | sed 's/ /-/g')
        convert "$filename" -type Grayscale "$new_filename.grayscale.jpg"
        gen_images "$new_filename.grayscale.jpg"
}

function gen_flop_images {
        local filename=$1

        local new_filename=$(echo $filename | sed 's/ /-/g')
        convert "$filename" -flop "$new_filename.flop.jpg"
        gen_images "$new_filename.flop.jpg"
}

function gen_images {
        local filename=$1
        
        local opt_filename=$(echo $filename | sed 's/ /-/g' | sed 's/\//-/g')
        local new_filename=$(echo $filename | sed 's/ /-/g')

        convert "$filename" -rotate 30 "$new_filename.rotated.30.jpg"&
        convert "$filename" -rotate 60 "$new_filename.rotated.60.jpg"&
        convert "$filename" -rotate 90 "$new_filename.rotated.90.jpg"&
        convert "$filename" -rotate 120 "$new_filename.rotated.120.jpg"&
        convert "$filename" -rotate 150 "$new_filename.rotated.150.jpg"&
        convert "$filename" -rotate 180 "$new_filename.rotated.180.jpg"&
        convert "$filename" -rotate 210 "$new_filename.rotated.210.jpg"&
        convert "$filename" -rotate 240 "$new_filename.rotated.240.jpg"&
        convert "$filename" -rotate 270 "$new_filename.rotated.270.jpg"&
        convert "$filename" -rotate 300 "$new_filename.rotated.300.jpg"&
        convert "$filename" -rotate 330 "$new_filename.rotated.330.jpg"&
}

find images/*/*.jpg ! -name "*rotated*" ! -name "*flop*" ! -name "*grayscale*" 2> /dev/null | while read file
do
    echo "Convert $file"

    opt_file=$(echo $file | sed 's/ /-/g' | sed 's/\//-/g')
    new_file=$(echo $file | sed 's/ /-/g')

    convert "$file" -resize 640 "$file"
    jpegtran -copy none -optimize "$file" > "/dev/shm/$opt_file" && cat "/dev/shm/$opt_file" > "$file"

#        gen_images "$file"&
#        gen_flop_images "$file"&
#        gen_grayscale_images "$file"&
done

find images/*/*.png ! -name "*rotated*" ! -name "*flop*" ! -name "*grayscale*" 2> /dev/null | while read file
do
    convert "$file" -resize 640 "$file"
    optipng -o7 -quiet "$file"
done

python prepair.py

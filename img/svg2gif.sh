`#!/bin/bash`

rm *.png
rm anim.gif

convert ../iEHR-Medicus-Diagram-anim.svg +repage bg.png
convert hand.svg -crop 200x200+0+0 +repage -transparent white hand.png

for ((i=1; i<=359; i=i+3))
do
  convert hand.png -gravity center -rotate $i tmp.png
  n=`printf "%03d" $i`
  composite -gravity center tmp.png bg.png hand${n}.png
  rm tmp.png
done

convert -delay 1  -loop 0 hand*.png anim.gif

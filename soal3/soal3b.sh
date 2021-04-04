#!/bin/bash

cd /home/ezhie/soal3
echo "" > Foto.log

for i in {1..23}
do
        wget https://loremflickr.com/320/240/kitten -O $( echo "Koleksi_"$i ) -a Foto.log
done

for ((i=1;i<=23;i++))
do
        for((j=i+1;j<=23;j++))
        do
                if diff $( echo "Koleksi_"$i) $( echo "Koleksi_"$j ) &> /dev/null
                then
                        rm $(echo "Koleksi_"$j )
                fi
        done
done

for i in {1..23}
do
        if [ ! -f $( printf "Koleksi_"$i  ) ]
        then
                for ((j=23; i<j; j-- ))
                do
                        if [ -f $( echo "Koleksi_"$j ) ]
                        then
                                mv $( echo "Koleksi_"$j  ) $( echo "Koleksi_"$i  )
                                break
                        fi
                done
        fi
done

target="$(date +%d)-$(date +%m)-$(date +%Y)"
mkdir $target
mv Koleksi_* $target
mv Foto.log $target


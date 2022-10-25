#!/bin/bash
awk '{
  if (length($8)>100){
      {print $4};
  }
}' instagram_posts.csv > profileList.txt
awk '{print $1} NR==10{exit}' profileList.txt > firstTenPosts.txt
profileList='firstTenPosts.txt'
profiles='instagram_profiles.csv'
head -n1 instagram_profiles.csv | tr , '\n' > result.txt
grep -f <(tr ',' '\n' < "${profileList}") "${profiles}" >> result.txt
rm firstTenPosts.txt
rm profileList.txt
while read -r line; do echo $line; printf "\n"; done < result.txt

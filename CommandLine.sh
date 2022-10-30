#!/bin/bash
limit=0;
awk -v limit=$limit '{
  if (length($8)>100){
      {print $4};
      limit++;
  }
  if (limit==10)
    exit;
}' instagram_posts.csv > profileList.txt
profileList='profileList.txt'
profiles='instagram_profiles.csv'
head -n1 instagram_profiles.csv | tr , '\n' > result.txt
grep -f <(tr ',' '\n' < "${profileList}") "${profiles}" >> result.txt
rm profileList.txt
while read -r line; do echo $line; printf "\n"; done < result.txt

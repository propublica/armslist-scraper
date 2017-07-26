#!/bin/bash

#./states.py | parallel --results cache/states ./scrape_index.py {} > cache/index.csv

./scrape_index.py illinois > cache/index.csv

./dedupe_index.py

echo "url,post_id,title,listed_date,price,location,city,state,description,registered,category,manufacturer,caliber,action,firearm_type,party,img,related_ids,number_of_related_listings" > cache/listings.csv
csvcut -c 1 cache/index-deduped.csv | parallel ./scrape_listing.py {} >> cache/listings.csv

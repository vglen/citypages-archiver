# build the image
docker build --tag htarchive:1.0 .

# run it
docker run -it --volume $(pwd):/app --env-file httrack.env htarchive:1.0

# clean up tmp that httrack leaves behind
find . -name "*.tmp" -type f -delete
bundle install
bundle exec jekyll build

cd _site
rm README.md* *.sh

if [ $? -ne 0 ]; then echo "Could not generate the site"; exit 1; fi

touch .nojekyll
bundle install
bundle exec jekyll build
cd _site
rm Gemfile Gemfile.lock readme.md

if [ $? -ne 0 ]; then echo "Could not generate the site"; exit 1; fi

touch .nojekyll
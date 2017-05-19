# publish.sh

# configure env
git config --global user.email 'admin@kidfund.us'
git config --global user.name 'kidfund-bot'

# checkout publish branch
git branch -D gh-pages
git checkout -b gh-pages

# commit build
git add -f _site
git commit -m "Build website"

git filter-branch --subdirectory-filter _site/ -f

git push "https://github.com/Kidfund/building.kid.fund" -f gh-pages

if [ $? -ne 0 ]; then echo "Could not push the site"; exit 1; fi

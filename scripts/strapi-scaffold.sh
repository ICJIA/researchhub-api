#!/bin/sh
APP_NAME=${APP_NAME:-strapi-app}
cd $APP_NAME

echo -e "\xe2\x9a\x99\xef\xb8\x8f Scaffolding custom setup...\n"

# replace index.html
cp -f ../public/* public

# install plugin
strapi install graphql &
wait "$!"

# generate api
sh ../strapi-generate.sh &
wait "$!"

echo -e "\033[0;32m\xe2\x9c\x94 \033[0mScaffolding complete.\n"
echo -e "\xe2\x9d\x97 Make sure to add media and relations type fields!" 
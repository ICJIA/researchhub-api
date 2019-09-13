#!/bin/sh
echo -e "\xe2\x9a\x99\xef\xb8\x8f Scaffolding custom setup...\n"

# overwrite ./public
mv -f ../public/* public
rm -r ../public

# use custom ./extensions/upload/services/Uploads.js
mkdir -p ./extensions/upload/services
mv ../Upload.js ./extensions/upload/services

# install plugin
strapi install graphql &
wait "$!"

# generate api
sh ../strapi-generate.sh &
wait "$!"

echo -e "\033[0;32m\xe2\x9c\x94 \033[0mScaffolding complete.\n"
echo -e "\xe2\x9d\x97 Make sure to add media and relations type fields!" 
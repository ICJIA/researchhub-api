#!/bin/sh
generate_api() {
    if [ ! -d "api/$NAME" ]
    then
        eval "strapi generate:api $NAME $ATTRS" &
        wait $!
    fi
}

## generate app type
NAME="app"
ATTRS="title:string published:boolean external:boolean slug:string date:date"
ATTRS="$ATTRS categories:json tags:json image:string contributors:json"
ATTRS="$ATTRS description:text src:string url:string citation:string"
ATTRS="$ATTRS funding:string"
generate_api

## generate article type
NAME="article"
ATTRS="title:string published:boolean external:boolean slug:string date:date"
ATTRS="$ATTRS type:json categories:json tags:json splash:string"
ATTRS="$ATTRS thumbnail:string images:json abstract:string markdown:text"
ATTRS="$ATTRS citation:string doi:string funding:string"
generate_api

## generate author type
NAME="author"
ATTRS="title:string external:boolean slug:string description:text"
generate_api

## generate dataset type
NAME="dataset"
ATTRS="title:string published:boolean external:boolean slug:string date:date"
ATTRS="$ATTRS categories:json tags:json sources:json unit:string"
ATTRS="$ATTRS agegroup:string timeperiod:json description:text notes:json"
ATTRS="$ATTRS variables:json citation:string funding:string datacsv:json"
ATTRS="$ATTRS  datafilename:string"
generate_api
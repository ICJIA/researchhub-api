#!/bin/sh
generate_api() {
    if [ ! -d "api/$NAME" ]
    then
        eval "strapi generate:api $NAME $ATTRS" &
        wait $!
    fi
}

# common attrs
ATTRS_COMMON="status:string title:string slug:string date:date external:boolean"
ATTRS_COMMON="$ATTRS_COMMON categories:json tags:json"

## generate app type
NAME="app"
ATTRS="$ATTRS_COMMON"
ATTRS="$ATTRS contributors:json image:string description:text url:string"
ATTRS="$ATTRS funding:string citation:string"
generate_api

## generate article type
NAME="article"
ATTRS="$ATTRS_COMMON"
ATTRS="$ATTRS authors:json splash:string thumbnail:string images:json"
ATTRS="$ATTRS abstract:string markdown:text"
ATTRS="$ATTRS mainfiletype:string funding:string citation:string doi:string"
generate_api

## generate dataset type
NAME="dataset"
ATTRS="$ATTRS_COMMON"
ATTRS="$ATTRS project:boolean sources:json unit:string timeperiod:json"
ATTRS="$ATTRS description:text notes:json variables:json"
ATTRS="$ATTRS funding:string citation:string"
generate_api

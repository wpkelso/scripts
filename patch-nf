#!/bin/bash

VERSION="0.1"

while getopts ':vo:?' OPTION; do
    case "$OPTION" in
        v)
            echo "EZ-Nerd Font patcher script version $VERSION"
            exit 1
            ;;
        o)
            OUTPUTDIR="$OPTARG"
            echo "Outputting to $OUTPUTDIR"
            ;;
        ?)
            echo "Usage: $0 [-o output_directory_name] TARGET" >&2
            exit 1
            ;;
    esac
done
shift "$(($OPTIND -1))"

TARGET="$*"
echo "Generating fonts for $TARGET"

echo "Starting normal patch"
fontforge -script font-patcher --careful --outputdir $OUTPUTDIR -c --progressbars $TARGET

echo "Starting mono patch"
fontforge -script font-patcher --careful --outputdir $OUTPUTDIR -c --mono --progressbars $TARGET

echo "Starting propo patch"
fontforge -script font-patcher --careful --outputdir $OUTPUTDIR -c --variable-width-glyphs --progressbars $TARGET


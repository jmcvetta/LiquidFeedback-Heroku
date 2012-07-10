#!/bin/bash
#
# install.sh </path/for/install/"
#

# set -x

VERSION_CORE="v2.0.11"
VERSION_WEBMCP="v1.2.3"
VERSION_ROCKET="v0.4"
BUILD_DIR=$1
CACHE_DIR=$2

#===============================================================================


if [ ! -d "$CACHE_DIR/$_core" ]; then
	echo "+++ Liquid Feedback Core"
	echo "Cleaning cache..."
	rm -rf $CACHE_DIR/liquid_feedback_core* 
	cd $CACHE_DIR
	wget http://www.public-software-group.org/pub/projects/liquid_feedback/backend/$VERSION_CORE/liquid_feedback_core-$VERSION_CORE.tar.gz
	tar -xvzf liquid_feedback_core-$VERSION_CORE.tar.gz
	cd liquid_feedback_core-$VERSION_CORE
	make
	rm -rf $BUILD_DIR/liquid_feedback_core
	mkdir $BUILD_DIR/liquid_feedback_core
	cp core.sql lf_update $BUILD_DIR/liquid_feedback_core/
fi

if [ ! -d "$CACHE_DIR/webmcp-$VERSION_WEBMCP" ]; then
	echo "+++ WebMCP"
	echo "Cleaning cache..."
	rm -rf $CACHE_DIR/webmcp*
	cd $CACHE_DIR
	wget http://www.public-software-group.org/pub/projects/webmcp/$VERSION_WEBMCP/webmcp-$VERSION_WEBMCP.tar.gz
	tar -xvzf webmcp-$VERSION_WEBMCP.tar.gz
	cd webmcp-$VERSION_WEBMCP
	sed -i=.orig '/^CFLAGS =/ s/$/ -I \/usr\/include\/lua5.1 -fno-stack-protector/' Makefile.options 
	make
	rm -rf $BUILD_DIR/webmcp
	mkdir $BUILD_DIR/webmcp
	cp -RL framework/* $BUILD_DIR/webmcp/
fi

if [ ! -d "$CACHE_DIR/rocketwiki-lqfb-$VERSION_ROCKET" ]; then
	echo "+++ RocketWiki LqFb-Edition"
	echo "Cleaning cache..."
	rm -rf $CACHE_DIR/rocketwiki-lqfb*
	cd $CACHE_DIR
	wget http://www.public-software-group.org/pub/projects/rocketwiki/liquid_feedback_edition/v0.4/rocketwiki-lqfb-$VERSION_ROCKET.tar.gz
	tar -xvzf rocketwiki-lqfb-$VERSION_ROCKET.tar.gz
	cd rocketwiki-lqfb-$VERSION_ROCKET
	make
	rm -rf $BUILD_DIR/rocketwiki-lqfb
	mkdir $BUILD_DIR/rocketwiki-lqfb
	cp rocketwiki-lqfb rocketwiki-lqfb-compat $BUILD_DIR/rocketwiki-lqfb/
fi

include makefile.am

CC		= gcc
CFLAGS	= -std=c99 -Wall -Wextra -Wshadow

test-run: test-build
	./test

test-build:
	$(CC) $(CFLAGS) test.c -o test

version-patch:
	./scripts/version_patch.sh version.h A $(VERSION_MAJOR) $(VERSION_MINOR) $(VERSION_PATCH) $(VERSION_RELEASE_CANDIDATE)

shellcheck:
	shellcheck *.sh ./scripts/*.sh

clean:
	rm -rfv makefile.am

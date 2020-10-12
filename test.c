#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "version.h"

#define TEST_COLOR_REST     "\033[0m"
#define TEST_COLOR_RED      "\033[31m"
#define TEST_COLOR_GREEN    "\033[32m"

#define ASSERT(expression) assert(expression)

#define TEST_ASSERT(expression) \
    printf("[ %s%s%s ] Test: %s\n", \
        expression ? TEST_COLOR_GREEN : TEST_COLOR_RED, \
        expression ? "PASSED" : "FAILED", \
        TEST_COLOR_REST,        \
        #expression);           \
        ASSERT(expression)

int main() {

    TEST_ASSERT(TEST_VERSION_MAJOR == 1);
    TEST_ASSERT(TEST_VERSION_MINOR == 20);
    TEST_ASSERT(TEST_VERSION_PATCH == 3);

#if TEST_VERSION_RELEASE_CANDIDATE_STATUS
    TEST_ASSERT(TEST_VERSION_RELEASE_CANDIDATE == 6);
    TEST_ASSERT((TEST_VERSION_RELEASE_CANDIDATE_STATUS == 1));
#else
    TEST_ASSERT(TEST_VERSION_RELEASE_CANDIDATE == 0);
#endif

#if TEST_VERSION_RELEASE_CANDIDATE_STATUS
    const char* test_version_text = "1.20.3-rc6";
#else
    const char* test_version_text = "1.20.3";
#endif

    printf("%s: %s\n", TEST_VERSION_VARIABLE_VALUE_TO_STRING_HELPER(test_version_text), test_version_text);
    TEST_ASSERT(strlen(test_version_text) == strlen(TEST_VERSION_TEXT));
    TEST_ASSERT(strcmp(test_version_text, TEST_VERSION_TEXT) == 0);

    return 0;
}
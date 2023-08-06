#include "unity.h"
#include <stdbool.h>
#include <stdlib.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"

/**
* This function should:
*   1) Call the my_username() function in Test_assignment_validate.c to get your hard coded username.
*   2) Obtain the value returned from function malloc_username_from_conf_file() in username-from-conf-file.h within
*       the assignment autotest submodule at assignment-autotest/test/assignment1/
*   3) Use unity assertion TEST_ASSERT_EQUAL_STRING_MESSAGE the two strings are equal.  See
*       the [unity assertion reference](https://github.com/ThrowTheSwitch/Unity/blob/master/docs/UnityAssertionsReference.md)
*/
void test_validate_my_username()
{
    // Step 1: Call my_username() function and get your hard-coded username
    const char* myUsername = my_username();

    // Step 2: Obtain the username from malloc_username_from_conf_file()
    const char* fileUsername = malloc_username_from_conf_file();

    // Step 3: Use Unity Assertion to check if the two usernames are equal
    TEST_ASSERT_EQUAL_STRING_MESSAGE(myUsername, fileUsername, "Username mismatch!");

    // Clean up any dynamically allocated resources if required
    // (e.g., free(fileUsername) if 'malloc_username_from_conf_file' allocated memory)

    // Optionally, you can also test additional scenarios here
    // For example, you can test if the username is not empty, etc.
}

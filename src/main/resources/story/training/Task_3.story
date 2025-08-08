Scenario: Navigate to the website homepage
When I navidate to the website homepage

Scenario: Log in as a Good User
When I login as user `${swagGoodUserName}` with password `${swagPassword}`
When I wait until element located by `id(shopping_cart_container)` appears
Then the page with the URL containing '/inventory.html' is loaded
!-- log out
When I log out

Scenario: Log in as a Locked User
When I login as user `${swagLockedUserName}` with password `${swagPassword}`
When I wait until element located by `xpath(//*[@data-test="error"])` appears
Then the page with the URL containing '/' is loaded
Then text `Epic sadface: Sorry, this user has been locked out.` exists
When I click on element located by `xpath(//*[@data-test="error-button"])`
Then text `Epic sadface: Sorry, this user has been locked out.` does not exist
!-- сlear fields
When I clear field located by `id(user-name)` using keyboard
When I clear field located by `id(password)` using keyboard

Scenario: Log in as a Broken User
When I login as user `${swagBrokenUserName}` with password `${swagPassword}`
When I wait until element located by `id(shopping_cart_container)` appears
Then the page with the URL containing '/inventory.html' is loaded
Then number of elements found by `xpath(//*[@src="/static/media/sl-404.168b1cce.jpg"])` is equal to `6`
!-- log out
When I log out

Scenario: Log in as a Slow User
When I login as user `${swagSlowUserName}` with password `${swagPassword}`
When I wait until element located by `caseSensitiveText(Swag Labs)` appears
When I wait until element located by `id(shopping_cart_container)` appears
Then the page with the URL containing '/inventory.html' is loaded

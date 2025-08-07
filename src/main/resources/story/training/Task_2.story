GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
When I enter `${swagGoodUserName}` in field located by `id(user-name)`
When I enter `${swagPassword}` in field located by `id(password)`
When I click on element located by `id(login-button)`
When I wait until element located by `id(shopping_cart_container)` appears
!-- check expected page loads
Then the page with the URL containing '/inventory.html' is loaded
!-- check 6 inventory items
Then number of elements found by `xpath(//*[@data-test="inventory-item-desc"])` is equal to `6`
!-- take a screenshot
When I take screenshot

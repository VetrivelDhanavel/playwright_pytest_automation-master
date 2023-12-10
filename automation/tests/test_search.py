import allure


@allure.title("Noon Search Test")
def test_noon_search(my_home_page):
    with allure.step("Load the home page"):
        my_home_page.load()

    with allure.step("Click the Login button"):
        my_home_page.click_login()


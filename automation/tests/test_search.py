import allure


def test_alpha_code_search(MyHomePage):
    with allure.step("Load the home page"):
        MyHomePage.load()

    # Assert that the page title contains "e"
    with allure.step("Assert that the page title contains 'e'"):
        assert "Home - Alphacode" in MyHomePage.page.title(), "The alphacode website is loaded successfully."


def test_navigate_to_contact(MyHomePage):
    with allure.step("Load the home page"):
        MyHomePage.load()
    with allure.step("Navigate to the contact page"):
        MyHomePage.navigate_to_contact()

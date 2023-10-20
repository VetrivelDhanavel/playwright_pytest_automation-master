from automation.src.pages.base_page import BasePage
from playwright.sync_api import Page

from automation.src.pages.locators import AlphaCode
from automation.test_data.data_test import TestData


class HomePage(BasePage):

    def __init__(self, page: Page):
        super().__init__(page)

    def load(self) -> None:
        self.page.goto(TestData.URL)

    def navigate_to_contact(self):
        self.page.locator(AlphaCode.CONTACTS).click()

from automation.src.pages.base_page import BasePage
from playwright.sync_api import Page

from automation.src.pages.locators import Noon
from automation.test_data.data_test import TestData


class HomePage(BasePage):

    def __init__(self, page: Page):
        super().__init__(page)



    def wait_for_load_completion(self):
        self.page.wait_for_load_state("load")

    def load(self) -> None:
        self.page.set_extra_http_headers({"HTTP2-Settings": ""})
        self.page.goto(TestData.URL)

    def click_login(self):
        self.page.wait_for_timeout(2000)
        self.page.wait_for_selector(Noon.LOGIN).click()
        self.page.wait_for_timeout(2000)

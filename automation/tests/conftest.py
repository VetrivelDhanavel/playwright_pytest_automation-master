import pytest
from playwright.sync_api import sync_playwright, Page
from automation.src.pages.home_page import HomePage


@pytest.fixture(scope='session')
def playwright():
    with sync_playwright() as playwright:
        yield playwright


@pytest.fixture(scope='function')
def context(playwright):
    browser = playwright.firefox.launch(headless=True)
    context = browser.new_context()
    yield context
    context.close()


@pytest.fixture
def page(context):
    return context.new_page()


@pytest.fixture
def my_home_page(page: Page) -> HomePage:
    return HomePage(page)

import pytest


def test_noon_search(my_home_page):
    my_home_page.load()
    my_home_page.wait_for_load_completion()
    my_home_page.click_login()

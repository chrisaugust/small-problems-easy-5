import unittest
import re

TIME_RE = re.compile(r"^(\d{2}):(\d{2})$")

def after_midnight(time: str) -> int:
    match = TIME_RE.match(time)
    if match is None:
        raise ValueError("time string not parsable")

    hours, minutes = match.groups()
    hours, minutes = int(hours), int(minutes)

    total = hours * 60 + minutes

    return total % 1440


def before_midnight(time: str) -> int:
    return -after_midnight(time) % 1440


class TestAfterMidnight(unittest.TestCase):
    def test_basic(self):
        self.assertEqual(after_midnight("12:34"), 754)


class TestBeforeMidnight(unittest.TestCase):
    def test_basic(self):
        self.assertEqual(before_midnight("12:34"), 686)

def return_func():
    x = 1
    func = lambda: print(x)
    return func

if __name__ == "__main__":
    # unittest.main()

    f = return_func()
    f()

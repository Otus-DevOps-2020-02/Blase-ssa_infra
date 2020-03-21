import unittest

class NumbersTest(unittest.TestCase):

    def test_equal(self):
        self.assertEqual(1 + 1, 10)

if __name__ == '__main__':
    unittest.main()

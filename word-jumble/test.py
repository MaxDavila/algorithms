import unittest
import jumble
import test_helper

class JumbleTest(unittest.TestCase):
	
	def test_populate_dict(self):
		generated = jumble.populate_dict(test_helper.test_file_path)
		assert  generated == test_helper.valid_dict


	def test_generate_permutations(self):
		generated = jumble.generate_permutations(test_helper.hello)
		assert generated == test_helper.valid_perm

	def test_jumble_with_results(self):
		generated = jumble.start(test_helper.word, test_helper.test_file_path)
		assert generated == test_helper.valid_set

	def test_jumble_with_no_results(self):
		generated = jumble.start(test_helper.unknown_word, test_helper.test_file_path)
		assert generated == "No words found for" + test_helper.unknown_word


if __name__ == '__main__':
	unittest.main()

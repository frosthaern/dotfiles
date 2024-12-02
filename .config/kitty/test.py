def isPrefixOfWord(sentence: str, searchWord: str):
    res = map(lambda x: searchWord in x, sentence.split(" "))
    return True if True in res else False


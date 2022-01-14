#242. Valid Anagram
#Given two strings s and t, return true if t is an anagram of s, and false otherwise.
#An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
#Input: s = "anagram", t = "nagaram"
#Output: true

#########################################################

#Slow solution 
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s = list(s)
        t = list(t)
        if len(s)!=len(t):
            return False
        for letter in t:
            if letter in s:
                del s[s.index(letter)]
            else: return False
        return True


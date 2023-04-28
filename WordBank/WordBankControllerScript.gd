extends Node3D

var WordListLocation = ""
var file = null

var LineCount = int(0)
var RandNum = RandomNumberGenerator.new()
var RandomWord = ""

#Each needs its own arry or it'll just clone itself all over
var WordArryNoun = []
var WordArryVerb = []
var WordArryAdverb = []
var WordArryAdjective = []

var TypeOfWord = ""
var DictOfWordArray = {}

func _ready():
	#Makes all the Dictionaries for it to pull from
	MakeArraysForEachPartOfSpeach()
	var testcounter = 0
	
	pass

func GetRandomWord(TypeOfWord):
	var ArrayToPullFrom = DictOfWordArray[TypeOfWord]
	return ArrayToPullFrom.pop_back()
	pass
	

#Builds arry from get_line which returns the "next line" until it's out of lines
func WordArryMaker(WordListLocation,WhichWordArry):
	file = FileAccess.open(WordListLocation, FileAccess.READ)
	while !file.eof_reached():
		WhichWordArry.append(file.get_line())
	WhichWordArry.shuffle()
	file.close()
	pass
	
func MakeArraysForEachPartOfSpeach():
	
	WordListLocation = "res://WordBank/WordLists/Wordlist-Nouns-Common-Audited-Saved-as-WINFile.txt"
	WordArryMaker(WordListLocation, WordArryNoun)
	DictOfWordArray["Noun"] = WordArryNoun
	
	WordListLocation = "res://WordBank/WordLists/Wordlist-Verbs-All.txt"
	WordArryMaker(WordListLocation, WordArryVerb)
	DictOfWordArray["Verb"] = WordArryVerb
	
	WordListLocation = "res://WordBank/WordLists/Wordlist-Adjectives-All.txt"
	WordArryMaker(WordListLocation, WordArryAdjective)
	DictOfWordArray["Adjective"] = WordArryAdjective
	
	WordListLocation = "res://WordBank/WordLists/Wordlist-Adverbs-All.txt"
	WordArryMaker(WordListLocation, WordArryAdverb)
	DictOfWordArray["Adverb"] = WordArryAdverb
	
	pass
	
#defunct in program, kept as example
#func OpenWordListCount(WordlListLocation):
#	file = FileAccess.open(WordlListLocation, FileAccess.READ)
#
#	# 0 is the number for no error apprently
#	if file.get_error() != 0:
#		print("Can't read ", WordListLocation, file.get_error())
#		return
#	#Loops and counts the words
#	while !file.eof_reached():
#		#Apprently this needs to be there for something to happen or it just spins in to infinity????
#		file.get_line()
#		LineCount += 1
#	file.close()
#	print(LineCount)
#	pass
##########################################

#   Old way of getting rando - now arry randomized in the make function
#	var TargetLineNum = RandNum.randi_range(0, LineCount)
#	var CurrentLineNum = int(0)
#	file = FileAccess.open(WordlListLocation, FileAccess.READ)
#	while CurrentLineNum != TargetLineNum -1:
#		file.get_line()
#		CurrentLineNum += 1
#	RandomWord = file.get_line()
#	print(RandomWord)
#	print(TargetLineNum, CurrentLineNum)
#	file.close()

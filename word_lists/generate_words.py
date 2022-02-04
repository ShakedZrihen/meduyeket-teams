import csv
import random

easy_words, all_words = set(), set()

all_words.update(line.strip() for line in open('hspell-nouns.txt'))
all_words.update(line.strip() for line in open('hspell-verbs.txt'))
all_words.update(line.strip() for line in open('hspell-other.txt'))
all_words.update(line.strip() for line in open('hspell-kitalon.txt'))
all_words.update('ל' + line[1:].strip() for line in open('hspell-makor.txt'))

easy_words.update(line.strip() for line in open('hspell-easy-nouns.txt'))
easy_words.update(line.strip() for line in open('hspell-easy-verbs.txt'))
easy_words.update(line.strip() for line in open('hspell-other.txt'))
easy_words.update('ל' + line[1:].strip() for line in open('hspell-makor.txt'))

freqs = {w: int(c) for w, c in csv.reader(open('cc100.csv')) if len(w) == 5}

past_meduyakot = ['כימאי', 'מעטפת', 'נקיות', 'חיסון', 'שתיקה', 'מבואר', 'יתגלה', 'רשאים', 'הוביל', 'לומדת', 'מקפיד']
missing_words = ['כורסא', 'ארצני' ,'משטור', 'עקידה', 'כאילו', 'האמנם', 'בגדול', 'הוביט', 'כושלה', 'רוגלה', 'נוזקה', 'חמודי', 'לומדה', 'תגילו', 'מטריל', 'גורון', 'הטריל', 'תטריל', 'אטריל']
hard_words = ['לצפון']

all_words.update(missing_words + past_meduyakot)
easy_words.update(past_meduyakot)
easy_words.difference_update(hard_words)

meduyakot = [w for w in easy_words if freqs.get(w, 0) >= 20000 and w not in past_meduyakot]
random.shuffle(meduyakot)
meduyakot = meduyakot[:14] + past_meduyakot + meduyakot[14:]

print('const CONCATED_WORDS = "' + ''.join(sorted(all_words)) + '";')
print('const POSSIBLE_MEDUYAKOT = "' + ''.join(meduyakot) + '";')

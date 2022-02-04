# The hspell-*.txt files are based on the Hspell 1.4 distribution. Here are the
# commands used to generate them:

perl -w woo -d woo.dat | sed "/\+/d" > verbs.hif
perl -w wolig.pl -d shemp.dat > shemp.hif
perl -w wolig.pl -d wolig.dat > nouns.hif

rm /meduyeket/word_lists/hspell-*.txt

for f in nouns.hif shemp.hif
  do
    iconv -f windows-1255 $f | grep -v '^#' | grep -v ',סמיכות' | cut -d, -f1 | egrep '^[א-תךםןףץ]{5} ' | cut -d' ' -f1 >> /meduyeket/word_lists/hspell-nouns.txt
    iconv -f windows-1255 $f | grep -v '^#' | grep -v ',סמיכות' | grep -v ',של/' | cut -d, -f1 | egrep '^[א-תךםןףץ]{5} ' | cut -d' ' -f1 >> /meduyeket/word_lists/hspell-easy-nouns.txt
    iconv -f windows-1255 $f | grep '^[א-תךםןףץ]י[א-תךםןףץ][א-תךםןףץ]ון' | grep -v ',סמיכות' | cut -b 1-2,5-12 >> /meduyeket/word_lists/hspell-kitalon.txt
done
for f in extrawords.hif milot.hif biza-nouns.hif
  do
    iconv -f windows-1255 $f | egrep '^[א-תךםןףץ]{5}$' >> /meduyeket/word_lists/hspell-other.txt
    iconv -f windows-1255 $f | egrep '^[א-תךםןףץ]{5} ' | cut -d' ' -f1 >> /meduyeket/word_lists/hspell-other.txt
done

for f in verbs.hif biza-verbs.hif
  do
    iconv -f windows-1255 $f | grep -v '^#' | grep -v ',סמיכות' | grep -v ',כינוי/' | egrep '^[א-תךםןףץ]{5} ' | cut -d' ' -f1 >> /meduyeket/word_lists/hspell-verbs.txt
    iconv -f windows-1255 $f | grep -v '^#' | grep -v ',סמיכות' | grep -v ',כינוי/' | grep -v ',ציווי' | grep -v ',את' | egrep '^[א-תךםןףץ]{5} ' | cut -d' ' -f1 >> /meduyeket/word_lists/hspell-easy-verbs.txt
    iconv -f windows-1255 $f | grep -v '^#' | grep -v ',כינוי/' | egrep '^L[א-תךםןףץ]{4} ' | cut -d' ' -f1 >> /meduyeket/word_lists/hspell-makor.txt
done

wc -l /meduyeket/word_lists/hspell-*.txt

# The corpus word count cc100.csv is downloaded from
#   https://github.com/eyaler/hebrew_wordlists

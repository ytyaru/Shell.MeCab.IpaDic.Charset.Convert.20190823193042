# MeCabの辞書をEUC-JPからUTF-8に変換する
Convert() {
	local PATH_OUT=${1:-/tmp/work}
	local DIR_IPADIC=/usr/share/mecab/dic/ipadic
	local CSV_FILES="Verb Adj Auxil"

	echo ${CSV_FILES}
	for FILE_NAME in ${CSV_FILES}; do
		cp "$(CsvPath "${FILE_NAME}")" "${PATH_OUT%/}/${FILE_NAME}.csv"
		iconv -f EUC-JP -t UTF-8 "${PATH_OUT%/}/${FILE_NAME}.csv" > "${PATH_OUT%/}/${FILE_NAME}.utf8.csv"
	done
}
CsvPath() { echo "/usr/share/mecab/dic/ipadic/${1:-Verb}.csv"; }
Convert


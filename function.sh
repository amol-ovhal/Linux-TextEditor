function addLineTop() {
    FILE_NAME=$1
    LINES=$2
    if test -f "${FILE_NAME}"; then
    sed "1i ${LINES}" ${FILE_NAME}
    infoMessage "Adding Lines at Top of $FILE_NAME"
    else 
    errorMessage "${FILE_NAME} File not exist"
fi
}

function addLineBottom() {
    FILE_NAME=$1
    LINES=$2
    if test -f "${FILE_NAME}"; then
    sed "$ a ${LINES}" ${FILE_NAME}
    infoMessage "Adding Lines at Bottom of $FILE_NAME"
    else 
    errorMessage "${FILE_NAME} File not exist"
fi
}

function addLineAt() {
    FILE_NAME=$1
    LINE_NUMBER=$2
    LINES=$3
    if test -f "${FILE_NAME}"; then
    sed "${LINE_NUMBER}i ${LINES}" ${FILE_NAME}
    infoMessage "Adding Lines at Line Number $LINE_NUMBER"
    else 
    errorMessage "${FILE_NAME} File not exist"
fi
}

 function updateFirstWord() {
    FILE_NAME=$1
    EXISTING_WORD=$2
    NEW_WORD=$3
    if test -f "${FILE_NAME}"; then
    sed "0,/$EXISTING_WORD/s/$EXISTING_WORD/$NEW_WORD/" $FILE_NAME
    infoMessage "Upadating Existing word $EXISTING_WORD into New word $NEW_WORD at First Occurance"
        else 
        errorMessage "${FILE_NAME} File not exist"
fi

 }

  function updateAllWords() {
    FILE_NAME=$1
    EXISTING_WORD=$2
    NEW_WORD=$3
    if test -f "${FILE_NAME}"; then
    sed "s/$EXISTING_WORD/$NEW_WORD/g" $FILE_NAME
    infoMessage "Upadating Existing word $EXISTING_WORD into New word $NEW_WORD at Every Occurance"
        else 
        errorMessage "${FILE_NAME} File not exist"
fi
 } 


 function insertWord() {
    FILE_NAME=$1
    WORD1=$2
    WORD2=$3
    WORD_TO_BE_INSERT=$4

     if test -f "${FILE_NAME}"; then
     echo "${WORD1} ${WORD2}" | sed 's/\('${WORD1}'\)/\1 '${WORD_TO_BE_INSERT}'/' ${FILE_NAME}
     infoMessage "Inserting Word $WORD_TO_BE_INSERT in between Words $WORD1 $WORD2 respecively."
     else 
      errorMessage "${FILE_NAME} File not exist"
     fi

 }

function deleteLineNumber() {
    FILE_NAME=$1
    LINE_NUMBER=$2

     if test -f "$1"; then
        if [ "${WORD_TO_DELETE_LINE}" == "" ]; then
        sed "${LINE_NUMBER}d" "${FILE_NAME}"
        infoMessage "Deleting Line Number ${LINE_NUMBER}."
        fi
      else 
      errorMessage "${FILE_NAME} File not exist"
  fi

}

function deleteLineWord() {
    FILE_NAME=$1
    WORD_TO_DELETE_LINE=$2

     if test -f "$1"; then
        sed '/'${WORD_TO_DELETE_LINE}'/d' "${FILE_NAME}"
        infoMessage "Deleting Line Containing Word '${WORD_TO_DELETE_LINE}'."
      else 
      errorMessage "${FILE_NAME} File not exist"
  fi

}